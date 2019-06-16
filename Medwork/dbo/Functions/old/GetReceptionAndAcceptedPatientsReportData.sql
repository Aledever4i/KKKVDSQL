CREATE FUNCTION [dbo].[GetReceptionAndAcceptedPatientsReportData]
(
	@DateStart date,
	@DateEnd date,
	@DoctorType int
)
RETURNS @Report table
(
	Name varchar(MAX),
	RecordedFreeReceptionsAll int,
	RecordedFreeReceptionsFirst int,
	RecordedFreeReceptionsRepeated int,
	RecordedPayReceptionsAll int,
	RecordedPayReceptionsFirst int,
	RecordedPayReceptionsRepeated int,
	ComingFreeReceptionsAll int,
	ComingFreeReceptionsFirst int,
	ComingFreeReceptionsRepeated int,
	ComingPayReceptionsAll int,
	ComingPayReceptionsFirst int,
	ComingPayReceptionsRepeated int
)
AS
BEGIN
	DECLARE @preData table (
		EmployeeId int,
		IsPay bit,
		IsFirst bit,
		IsComming bit,
		Speciality int,
		ReceptionTime datetime
	)

	INSERT INTO @preData
		SELECT
			nap.[Resource] AS EmployeeId,
			CASE WHEN nap.FinanceSourceId IN (1, 2) THEN 0 ELSE 1 END AS IsPay, -- 1 - ОМС, 2 - Бюджет
			CASE WHEN nap.TipPriema = 'Первичный' THEN 1 WHEN nap.TipPriema = 'Повторный' THEN 0 END AS IsFirst,
			nap.Prishel AS IsComming,
			CASE 
				WHEN usr.UsrJob IN (37, 165) AND usr.UsrDept = 21 THEN 1 -- 37 - Дерматолог, 165 - Детский дерматолог, 21 - Поликлинника Влад
				WHEN usr.UsrJob = 16 AND usr.UsrDept = 21 THEN 2 -- 16 - Венеролог, 21 - Поликлинника Влад
				WHEN usr.UsrJob IN (16, 37, 165) AND usr.UsrDept = 30 THEN 3
				WHEN usr.UsrJob NOT IN (16, 37, 165) THEN 4
			END AS Speciality,
			CAST(nap.DataPriema AS date) AS ReceptionTime
			FROM dbo.Napravlenie AS nap
			JOIN dbo.ResourcesView AS usr ON usr.ID = nap.[Resource]
			WHERE 
				nap.FinanceSourceId IS NOT NULL
				AND nap.DataPriema >= @DateStart
				AND nap.DataPriema <= @DateEnd

	INSERT INTO @preData
		SELECT
			mo.MW_Resource_ID AS EmployeeId,
			0 AS IsPay,
			1 AS IsFirst, -- 1 - Первичный
			0 AS IsComming,
			CASE 
				WHEN usr.UsrJob IN (37, 165) AND usr.UsrDept = 21 THEN 1 -- 37 - Дерматолог, 165 - Детский дерматолог, 21 - Поликлинника Влад
				WHEN usr.UsrJob = 16 AND usr.UsrDept = 21 THEN 2 -- 16 - Венеролог, 21 - Поликлинника Влад
				WHEN usr.UsrJob IN (16, 37, 165) AND usr.UsrDept = 30 THEN 3
				WHEN usr.UsrJob NOT IN (16, 37, 165) THEN 4
			END AS Speciality,
			CAST(mo.Reception_Datetime AS date) AS ReceptionTime
			FROM dbo.MedihostOrder AS mo
			JOIN dbo.ResourcesView AS usr ON usr.ID = mo.MW_Resource_ID
			WHERE
				CAST(mo.Reception_Datetime AS date) BETWEEN @DateStart AND @DateEnd
				AND mo.ShowInSchedule = 1
				AND mo.NapravlenieID IS NULL
				
	INSERT INTO @preData
		SELECT
			sz.[Resource] AS EmployeeId,
			0 AS IsPay,
			CASE
				WHEN sz.Category = 'первичный пациент' THEN 1
				WHEN sz.Category = 'анонимный звонок' THEN 1
				WHEN sz.Category = 'повторный пациент' THEN 0
				WHEN sz.Category = '' THEN 1
			END AS IsFirst, -- 1 - Первичный
			0 AS IsComming,
			CASE 
				WHEN usr.UsrJob IN (37, 165) AND usr.UsrDept = 21 THEN 1 -- 37 - Дерматолог, 165 - Детский дерматолог, 21 - Поликлинника Влад
				WHEN usr.UsrJob = 16 AND usr.UsrDept = 21 THEN 2 -- 16 - Венеролог, 21 - Поликлинника Влад
				WHEN usr.UsrJob IN (16, 37, 165) AND usr.UsrDept = 30 THEN 3
				WHEN usr.UsrJob NOT IN (16, 37, 165) THEN 4
			END AS Speciality,
			CAST(sz.DataPriema AS date) AS ReceptionTime
			FROM dbo.SpisokZvonkov AS sz
			JOIN dbo.ResourcesView AS usr ON usr.ID = sz.[Resource] AND usr.[Type] = 1
			WHERE 
				CAST(sz.DataPriema AS date) BETWEEN @DateStart AND @DateEnd
				AND sz.ShowInSchedule = 1
				AND sz.AppointmentId IS NULL


	INSERT INTO @Report
		SELECT
			usr.Name,
			ISNULL(SUM(CASE WHEN pr.IsPay = 0 THEN 1 ELSE 0 END), 0) AS [Записано, Бесплатный приём, Всего],
			ISNULL(SUM(CASE WHEN pr.IsPay = 0 AND pr.IsFirst = 1 THEN 1 END), 0) AS [Записано, Бесплатный приём, Первичные],
			ISNULL(SUM(CASE WHEN pr.IsPay = 0 AND pr.IsFirst = 0 THEN 1 END), 0) AS [Записано, Бесплатный приём, Повторные],
			ISNULL(SUM(CASE WHEN pr.IsPay = 1 THEN 1 ELSE 0 END), 0) AS [Записано, Платный приём, Всего],
			ISNULL(SUM(CASE WHEN pr.IsPay = 1 AND pr.IsFirst = 1 THEN 1 END), 0) AS [Записано, Платный приём, Первичные],
			ISNULL(SUM(CASE WHEN pr.IsPay = 1 AND pr.IsFirst = 0 THEN 1 END), 0) AS [Записано, Платный приём, Повторные],
			ISNULL(SUM(CASE WHEN pr.IsPay = 0 AND pr.IsComming = 1 THEN 1 ELSE 0 END), 0) AS [Пришёл, Бесплатный приём, Всего],
			ISNULL(SUM(CASE WHEN pr.IsPay = 0 AND pr.IsComming = 1 AND pr.IsFirst = 1 THEN 1 END), 0) AS [Пришёл, Бесплатный приём, Первичные],
			ISNULL(SUM(CASE WHEN pr.IsPay = 0 AND pr.IsComming = 1 AND pr.IsFirst = 0 THEN 1 END), 0) AS [Пришёл, Бесплатный приём, Повторные],
			ISNULL(SUM(CASE WHEN pr.IsPay = 1 AND pr.IsComming = 1 THEN 1 ELSE 0 END), 0) AS [Пришёл, Платный приём, Всего],
			ISNULL(SUM(CASE WHEN pr.IsPay = 1 AND pr.IsComming = 1 AND pr.IsFirst = 1 THEN 1 END), 0) AS [Пришёл, Платный приём, Первичные],
			ISNULL(SUM(CASE WHEN pr.IsPay = 1 AND pr.IsComming = 1 AND pr.IsFirst = 0 THEN 1 END), 0) AS [Пришёл, Платный приём, Повторные]
			FROM @preData AS pr
			JOIN dbo.ResourcesView AS usr ON usr.ID = pr.EmployeeId
			WHERE pr.Speciality = @DoctorType
			GROUP BY usr.Name
			
	RETURN
END