CREATE FUNCTION dbo.IsFreeTimeResource
(
	@ResourceID int, -- ID ресурса
	@DataPriema datetime, -- Дата и время приёма
	@Interval int -- Заданный диапозов поиска (минуты)
)
RETURNS bit
AS
BEGIN
	DECLARE
		@Date date = CAST(@DataPriema AS date), -- Получаем дату из переданных данных
		@Time time = CAST(@DataPriema AS time), -- Получаем время из переданых данных
		@DayScheduleID int, -- Идентификатор расписания к которому в существующем периоде пренадлежит ресурс
		@IsWorkDay bit -- Является ли переданная дата, рабочим днём для ресурса

	-- У таблиц всегда должен быть свой собственный DECLARE
	DECLARE @WorkInterval table (d_beg time, d_end time) -- Интервал расписания к которому привязан ресурс
	DECLARE @FreeWorkInterval table (d_beg time) -- Интервалы которые еще не заняты
	
	SELECT TOP 1 -- Если интервалов будет несколько, то что-то пошло не так
		@DayScheduleID = ti.DayScheduleID
		FROM dbo.TimeIntervals AS ti
		JOIN dbo.daySchedules AS sh ON sh.ID = ti.DayScheduleID
		LEFT JOIN dbo.RecurrencePatterns AS rp ON rp.DayScheduleID = sh.ID
		WHERE 
			ti.Type = 1 -- 1 - Приём (запись)
			AND rp.isAct = 1 -- 1 - Активный
			AND sh.ResourceID = @ResourceID
			AND @Date BETWEEN rp.Start AND rp.Finish -- Находим расписание к которому принадлежит переданная дата
		ORDER BY
			ti.ID,
			rp.ID,
			sh.ID
		
	SELECT -- Определяем, является ли для данного ресурса, день рабочим
		@IsWorkDay = CASE
			WHEN SUM( -- Суммируем корректироваки, если они суммарно дают -1, то это выходной.
				CASE -- Данный CASE нужен для схлопывания данных
					WHEN cp.isAct = 0 THEN -1 
					ELSE cp.isAct
					END	
				) < 0
				THEN 0
			ELSE 1
			END
		FROM dbo.CorrectionPatterns AS cp
		WHERE 
			cp.DayScheduleID = @DayScheduleID
			AND CAST(cp.Date AS date) = @Date
	
	IF (@IsWorkDay = 0)
	BEGIN
		RETURN 0
	END

	INSERT INTO @WorkInterval (d_beg, d_end) -- Получаем интервал работы расписания
		SELECT
			CONVERT(TIME, ti.BeginTime),
			CONVERT(TIME, ti.EndTime)
			FROM dbo.TimeIntervals AS ti
			WHERE 
				ti.DayScheduleID = @DayScheduleID
				AND ti.Type = 1 -- 1 - Приём (запись)

	;WITH cte(d_beg, d_end) AS -- Запускаем цикл заполнения промежутков расписания
	(
		SELECT 
			wi.d_beg, -- Начало расписания - время
			wi.d_end -- Конец расписания - время
			FROM @WorkInterval AS wi 
		UNION ALL
		SELECT 
			DATEADD(MINUTE, 15, cte.d_beg), d_end -- Интервал между приёмами 15 минут
			FROM cte
			WHERE cte.d_beg < cte.d_end -- Данные заполняются пока не уткнуться в конец расписания
	)
	INSERT INTO @FreeWorkInterval(d_beg) -- Заполняем временную таблицу еще не занятых приёмов
		SELECT cte.d_beg 
			FROM cte -- Собираем все даты из промежутка, которые есть по умолчанию
		EXCEPT -- EXCEPT - выкидываем из начальной таблицы дублирующие данные из второй
		SELECT -- Собираем уже существующие записи на приём
			vremya.VremyaPriema
			FROM (
				SELECT
					CAST(nap.VremyaPriema AS time) AS VremyaPriema
					FROM dbo.Napravlenie AS nap -- Обычная запись через регистратора
					WHERE 
						CAST(nap.DataPriema AS date) = @Date
						AND nap.Resource = @ResourceID
				UNION
				SELECT
					CAST(mo.Reception_Datetime AS time) AS VremyaPriema	
					FROM dbo.MedihostOrder AS mo -- Запись через сайт
					WHERE
						CAST(mo.Reception_Datetime AS date) = @Date
						AND mo.ShowInSchedule = 1
						AND mo.Resource_ID = @ResourceID
				UNION 
				SELECT
					CAST(sz.VremyaPriema AS time) AS VremyaPriema	
					FROM dbo.SpisokZvonkov AS sz -- Запись через телефонный звонок
					WHERE 
						CAST(sz.DataPriema AS date) = @Date
						AND sz.ShowInSchedule = 1
						AND sz.Resource = @ResourceID
			) AS vremya
		
	RETURN
		CASE
			WHEN EXISTS ( -- Проверяем, что данное время свободно, или в промежутке
				SELECT 
					* 
					FROM @FreeWorkInterval AS fwi
					WHERE 
						fwi.d_beg = @Time
						OR fwi.d_beg BETWEEN DATEADD(MINUTE, -@Interval, @Time) AND DATEADD(MINUTE, @Interval, @Time)
			) THEN 1
			ELSE 0
			END
END

