CREATE PROCEDURE [dbo].[GetReceptionAndAcceptedPatientsReport] 
	@DateStart date,
	@DateEnd date,
	@DoctorType int
AS
BEGIN
	DECLARE @Report table (
		RecId int,
		[Order] int,
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

	IF (@DoctorType = 1 OR @DoctorType = 0)
	BEGIN
		INSERT INTO @Report(RecId, [Order], Name) VALUES (1, 10, 'Дерматологи')

		INSERT INTO @Report
			SELECT
				1,
				11,
				gr.*
				FROM dbo.GetReceptionAndAcceptedPatientsReportData(@DateStart, @DateEnd, 1) AS gr
				
		INSERT INTO @Report
			SELECT
				1,
				12,
				'Итого',
				SUM(gr.RecordedFreeReceptionsAll),
				SUM(gr.RecordedFreeReceptionsFirst),
				SUM(gr.RecordedFreeReceptionsRepeated),
				SUM(gr.RecordedPayReceptionsAll),
				SUM(gr.RecordedPayReceptionsFirst),
				SUM(gr.RecordedPayReceptionsRepeated),
				SUM(gr.ComingFreeReceptionsAll),
				SUM(gr.ComingFreeReceptionsFirst),
				SUM(gr.ComingFreeReceptionsRepeated),
				SUM(gr.ComingPayReceptionsAll),
				SUM(gr.ComingPayReceptionsFirst),
				SUM(gr.ComingPayReceptionsRepeated)
				FROM dbo.GetReceptionAndAcceptedPatientsReportData(@DateStart, @DateEnd, 1) AS gr
				
		INSERT INTO @Report(RecId, [Order]) VALUES (1, 13)
	END
	
	IF (@DoctorType = 2 OR @DoctorType = 0)
	BEGIN
		INSERT INTO @Report(RecId, [Order], Name) VALUES (1, 20, 'Венерологи')
	
		INSERT INTO @Report
			SELECT
				2,
				21,
				gr.*
				FROM dbo.GetReceptionAndAcceptedPatientsReportData(@DateStart, @DateEnd, 2) AS gr
				
		INSERT INTO @Report
			SELECT
				2,
				22,
				'Итого',
				SUM(gr.RecordedFreeReceptionsAll),
				SUM(gr.RecordedFreeReceptionsFirst),
				SUM(gr.RecordedFreeReceptionsRepeated),
				SUM(gr.RecordedPayReceptionsAll),
				SUM(gr.RecordedPayReceptionsFirst),
				SUM(gr.RecordedPayReceptionsRepeated),
				SUM(gr.ComingFreeReceptionsAll),
				SUM(gr.ComingFreeReceptionsFirst),
				SUM(gr.ComingFreeReceptionsRepeated),
				SUM(gr.ComingPayReceptionsAll),
				SUM(gr.ComingPayReceptionsFirst),
				SUM(gr.ComingPayReceptionsRepeated)
				FROM dbo.GetReceptionAndAcceptedPatientsReportData(@DateStart, @DateEnd, 2) AS gr
				
		INSERT INTO @Report(RecId, [Order]) VALUES (2, 23)
	END
	
	IF (@DoctorType = 3 OR @DoctorType = 0)
	BEGIN
		INSERT INTO @Report(RecId, [Order], Name) VALUES (1, 30, 'Уссурийск')
	
		INSERT INTO @Report
			SELECT
				3,
				31,
				gr.*
				FROM dbo.GetReceptionAndAcceptedPatientsReportData(@DateStart, @DateEnd, 3) AS gr
				
		INSERT INTO @Report
			SELECT
				3,
				32,
				'Итого',
				SUM(gr.RecordedFreeReceptionsAll),
				SUM(gr.RecordedFreeReceptionsFirst),
				SUM(gr.RecordedFreeReceptionsRepeated),
				SUM(gr.RecordedPayReceptionsAll),
				SUM(gr.RecordedPayReceptionsFirst),
				SUM(gr.RecordedPayReceptionsRepeated),
				SUM(gr.ComingFreeReceptionsAll),
				SUM(gr.ComingFreeReceptionsFirst),
				SUM(gr.ComingFreeReceptionsRepeated),
				SUM(gr.ComingPayReceptionsAll),
				SUM(gr.ComingPayReceptionsFirst),
				SUM(gr.ComingPayReceptionsRepeated)
				FROM dbo.GetReceptionAndAcceptedPatientsReportData(@DateStart, @DateEnd, 3) AS gr
			
		INSERT INTO @Report(RecId, [Order]) VALUES (3, 33)
	END
	
	IF (@DoctorType = 4 OR @DoctorType = 0)
	BEGIN	
		INSERT INTO @Report(RecId, [Order], Name) VALUES (1, 40, 'Остальные')
	
		INSERT INTO @Report
			SELECT
				4,
				41,
				gr.*
				FROM dbo.GetReceptionAndAcceptedPatientsReportData(@DateStart, @DateEnd, 4) AS gr
				
		INSERT INTO @Report
			SELECT
				4,
				42,
				'Итого',
				SUM(gr.RecordedFreeReceptionsAll),
				SUM(gr.RecordedFreeReceptionsFirst),
				SUM(gr.RecordedFreeReceptionsRepeated),
				SUM(gr.RecordedPayReceptionsAll),
				SUM(gr.RecordedPayReceptionsFirst),
				SUM(gr.RecordedPayReceptionsRepeated),
				SUM(gr.ComingFreeReceptionsAll),
				SUM(gr.ComingFreeReceptionsFirst),
				SUM(gr.ComingFreeReceptionsRepeated),
				SUM(gr.ComingPayReceptionsAll),
				SUM(gr.ComingPayReceptionsFirst),
				SUM(gr.ComingPayReceptionsRepeated)
				FROM dbo.GetReceptionAndAcceptedPatientsReportData(@DateStart, @DateEnd, 4) AS gr
				
		INSERT INTO @Report(RecId, [Order]) VALUES (4, 43)
	END

	SELECT
		report.Name,
		report.RecordedFreeReceptionsFirst,
		report.ComingFreeReceptionsFirst,
		CASE
			WHEN report.RecordedFreeReceptionsFirst = 0
				THEN 0
			ELSE ROUND((report.RecordedFreeReceptionsFirst - report.ComingFreeReceptionsFirst) / CAST(report.RecordedFreeReceptionsFirst AS float), 4)
		END,
		report.RecordedFreeReceptionsRepeated,
		report.ComingFreeReceptionsRepeated,
		CASE
			WHEN report.RecordedFreeReceptionsRepeated = 0
				THEN 0
			ELSE ROUND((report.RecordedFreeReceptionsRepeated - report.ComingFreeReceptionsRepeated) / CAST(report.RecordedFreeReceptionsRepeated AS float), 4)
		END,
		report.RecordedFreeReceptionsAll,
		report.ComingFreeReceptionsAll,
		CASE
			WHEN report.RecordedFreeReceptionsAll = 0
				THEN 0
			ELSE ROUND((report.RecordedFreeReceptionsAll - report.ComingFreeReceptionsAll) / CAST(report.RecordedFreeReceptionsAll AS float), 4)
		END,
		report.RecordedPayReceptionsFirst,
		report.ComingPayReceptionsFirst,
		CASE
			WHEN report.RecordedPayReceptionsFirst = 0
				THEN 0
			ELSE ROUND((report.RecordedPayReceptionsFirst - report.ComingPayReceptionsFirst) / CAST(report.RecordedPayReceptionsFirst AS float), 4)
		END,
		report.RecordedPayReceptionsRepeated,
		report.ComingPayReceptionsRepeated,
		CASE
			WHEN report.RecordedPayReceptionsRepeated = 0
				THEN 0
			ELSE ROUND((report.RecordedPayReceptionsRepeated - report.ComingPayReceptionsRepeated) / CAST(report.RecordedPayReceptionsRepeated AS float), 4)
		END,
		report.RecordedPayReceptionsAll,
		report.ComingPayReceptionsAll,
		CASE
			WHEN report.RecordedPayReceptionsAll = 0
				THEN 0
			ELSE ROUND((report.RecordedPayReceptionsAll - report.ComingPayReceptionsAll) / CAST(report.RecordedPayReceptionsAll AS float), 4)
		END
		FROM @Report AS report
	ORDER BY report.[order]
END

		