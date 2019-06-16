CREATE FUNCTION [dbo].[GetShedType]
(
	@ResourceID int, -- ID ресурса
	@DataPriema datetime, -- Дата и время приёма
	@TimePriema datetime -- Дата и время приёма
)
RETURNS nvarchar(255)
AS
BEGIN
	DECLARE
--		@ResourceID int = 502,
		@DayScheduleID int,
		@Date date = CAST(@DataPriema AS date),
		@Time time = CAST(@TimePriema  AS time), -- Получаем время из переданых данных
		@ret nvarchar(255),
		@IsWorkDay bit
	SELECT TOP 1 -- Если интервалов будет несколько, то что-то пошло не так
		@DayScheduleID = ti.DayScheduleID
		--,ti.Type
		FROM dbo.TimeIntervals AS ti
		JOIN dbo.daySchedules AS sh ON sh.ID = ti.DayScheduleID
		LEFT JOIN dbo.RecurrencePatterns AS rp ON rp.DayScheduleID = sh.ID
		left join dbo.CorrectionPatterns AS cp on cp.DayScheduleID = sh.ID
		WHERE 
		/*	ti.Type = 1 -- 1 - Приём (запись)
			AND*/
 rp.isAct = 1 -- 1 - Активный
			AND 
				( CASE
				--	when rp.recurrence=1 THEN -- для типа потворения "ежедневно" определяем действует ли в этот день
					WHEN rp.recurrence=1 THEN -- для типа потворения "еженедельно" определяем действует ли в этот день недели
						CASE
							WHEN rp.occurdays&1 >0 and DATEPART(dw,@date)=7 then 1
							WHEN rp.occurdays&2 >0 and DATEPART(dw,@date)=1 then 1
							when rp.occurdays&4 >0 and DATEPART(dw,@date)=2 then 1
							when rp.occurdays&8 >0 and DATEPART(dw,@date)=3 then 1
							when rp.occurdays&16>0 and DATEPART(dw,@date)=4 then 1
							when rp.occurdays&32>0 and DATEPART(dw,@date)=5 then 1
							when rp.occurdays&64>0 and DATEPART(dw,@date)=6 then 1
							ELSE 0
						end
				--	when rp.recurrence=2 THEN -- для типа потворения "ежемесечно" определяем действует ли в этот день
				--	when rp.recurrence=3 THEN -- для типа потворения "ежегодно" определяем действует ли в этот день
					ELSE 0
				END)>0
			AND sh.ResourceID = @ResourceID
			AND ((@Date BETWEEN rp.Start AND rp.Finish) or (rp.Start < @Date and rp.finish<'01.01.1900')) -- Находим расписание к которому принадлежит переданная дата
			and @Time >= CAST(ti.begintime AS time) 
			and @Time < CAST(ti.endtime AS time)


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


select 
@ret=CASE 
	WHEN @IsWorkDay = 0 THEN '0'
	ELSE (
	--select tit.Name 
	select tit.id
	from TimeIntervalTypes tit 
	where Tit.id = (select ti.type from TimeIntervals ti where ti.DayScheduleID = @DayScheduleID and @Time >= CAST(ti.begintime AS time) and @Time < CAST(ti.endtime AS time) )
	)
END	


return @ret
--return @DayScheduleID
END