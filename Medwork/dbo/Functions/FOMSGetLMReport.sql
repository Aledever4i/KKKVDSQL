CREATE FUNCTION [dbo].[FOMSGetLMReport](@ReportId int)
RETURNS varchar(MAX)
AS
BEGIN
	-- Функция возвращает информацию для LM файла ФОМС для определенного отчета
	DECLARE 
		@LM xml,
		@ReportName varchar(20)
		
	SET @ReportName = dbo.FOMSGetReportName(@ReportId)
		
	SET @LM = (
		SELECT
			(
				SELECT
					'2.1' AS "VERSION",
					CAST(CONVERT(varchar, GETDATE(), 121) AS varchar(10)) AS "DATA",
					'L' + @ReportName AS "FILENAME",
					'H' + @ReportName AS "FILENAME1"
					FOR XML PATH ('ZGLV'), type
			),
			(
				SELECT
					p.ID AS "ID_PAC", -- Уникальный идентификатор пациента
					p.LastName AS "FAM",
					p.FirstName AS "IM",
					p.SecondName AS "OT",
					CASE
						WHEN p.Sex = 'M' THEN 1
						WHEN p.Sex = 'F' THEN 2
						END AS "W",
					CAST(p.BirthDate AS date) AS "DR",
					f11.IDDoc AS "DOCTYPE",
					p.SeriyaPasporta AS "DOCSER", -- Поле используется для всех документов помимо паспорта
					p.NomerPasporta AS "DOCNUM" -- Поле используется для всех документов помимо паспорта
					FOR XML PATH ('PERS'), type

			)
			FROM dbo.FOMSReports AS rep
			JOIN dbo.FOMSRequests AS r ON r.ReportId = rep.ID
			JOIN dbo.Patient AS p ON p.ID = r.PatID
			LEFT JOIN dbo.FOMSF011 AS f11 ON f11.ID = p.TipDocumenta
			WHERE rep.ID = @ReportId
			FOR XML PATH('PERS_LIST'), type
	)
	
	RETURN CONVERT(varchar(MAX), @LM)
END