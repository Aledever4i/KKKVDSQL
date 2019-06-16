CREATE FUNCTION dbo.PatientsDiagnosisL40OnDates
(	
	@ReportDateStart date,
	@ReportDateEnd date
)
RETURNS @Report table
(
	CardNum int,
	LastName varchar(MAX),
	FirstName varchar(MAX),
	MiddleName varchar(MAX),
	BirthDate date,
	DiagnosisId int,
	DiagnosisName varchar(MAX),
	DiagnosisDate date,
	Vrach varchar(MAX),
	TypeId varchar(MAX)
) 
AS
BEGIN
	INSERT INTO @Report
		SELECT
			p.CardNum,
			p.LastName,
			p.FirstName,
			p.SecondName,
			CONVERT(varchar(10), p.BirthDate, 104) AS BirthDate,
			CASE WHEN per.DiagDict = '' THEN NULL ELSE per.DiagDict END,
			per.DiagCode,
			CONVERT(varchar(10), CAST(per.Data AS date), 104) AS DiagnosisDate,
			u.name as Vrach,
			'первичный'
			FROM dbo.PervichniyPriemDermatologa AS per
			JOIN dbo.Patient AS p ON p.ID = per.PatID
			JOIN dbo.Usr as u on u.id=per.Vrach
			WHERE
				CAST(per.Data AS date) BETWEEN @ReportDateStart AND @ReportDateEnd
				AND per.DiagDict IS NOT NULL
				AND per.DiagDict <> ''
			
	INSERT INTO @Report
		SELECT
			p.CardNum,
			p.LastName,
			p.FirstName,
			p.SecondName,
			CONVERT(varchar(10), p.BirthDate, 104) AS BirthDate,
			CASE WHEN pov.DiagDict = '' THEN NULL ELSE pov.DiagDict END,
			pov.DiagCode,
			CONVERT(varchar(10), pov.Data, 104) AS DiagnosisDate,
			u.name as Vrach,
			'повторный'
			FROM dbo.PovtorniyPriemDermatologa AS pov
			JOIN dbo.Patient AS p ON p.ID = pov.PatID
			JOIN dbo.Usr as u on u.id=pov.Vrach
			WHERE
				CAST(pov.Data AS date) BETWEEN @ReportDateStart AND @ReportDateEnd
				AND pov.DiagDict IS NOT NULL
				AND pov.DiagDict <> ''
			
	INSERT INTO @Report
		SELECT
			p.CardNum,
			p.LastName,
			p.FirstName,
			p.SecondName,
			CONVERT(varchar(10), p.BirthDate, 104) AS BirthDate,
			m.ID,
			dis.DiagCode,
			CONVERT(varchar(10), dis.beg_date, 104) AS DiagnosisDate,
			u.name as Vrach,
			'диспансер'
			FROM dbo.Dispanser AS dis
			JOIN dbo.Patient AS p ON p.ID = dis.PatID
			JOIN dbo.mkb10 AS m ON m.KOD = dis.DiagCode
			JOIN dbo.PatForm as pf on pf.ID = dis.ID
			JOIN dbo.Usr as u on u.id=pf.AuthorID
			WHERE
				CAST(dis.beg_date AS date) BETWEEN @ReportDateStart AND @ReportDateEnd
	
	DELETE FROM @Report
		WHERE DiagnosisId NOT IN (
			11138, --L40
			11139,	--L40.0	Псориаз обыкновенный
			11140,	--L40.1	Генерализованный пустулезный псориаз
			11141,	--L40.2	Акродерматит стойкий (аллопо)
			11142,	--L40.3	Пустулез ладонный и подошвенный
			11143,	--L40.4	Псориаз каплевидный
			11144,	--L40.5	+Псориаз артропатический (m07.0-m07.3*, m09.0*)
			11145,	--L40.8	Другой псориаз
			11146	--L40.9	Псориаз неуточненный
		)
	
		
	--номер карты | фамилия | имя | отчество | дата рождения | диагноз | дата установления диагноза

	--диагноз: берем из 3х таблиц PervichniyPriemDermatologa, PovtorniyPriemDermatologa, dispanser  - поле DiagCode, которое содержит в первых трех символах "L40".
	--дата установления диагноза: в таблицах осмотров это поле Data, в таблице dispanser - поле beg_date
	--Пациенты должны быть уникальны (по номеру карты).
	
	RETURN
END
