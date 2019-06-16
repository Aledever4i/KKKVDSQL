CREATE FUNCTION [dbo].[FOMSGetPMReport]
(
	@ReportId int
)
RETURNS varchar(MAX)
AS
BEGIN
	DECLARE 
		@PMxml xml,
		@ReportName varchar(20)
		
	SET @ReportName = dbo.FOMSGetReportName(@ReportId)
		
	SELECT @PMxml = (
		SELECT
			(
				SELECT
					'2.1' AS "VERSION",
					CAST(CONVERT(varchar, GETDATE(), 121) AS varchar(10)) AS "DATA",
					'P' + @ReportName AS "FILENAME", 
					'H' + @ReportName AS "FILENAME1"
					FOR XML PATH ('ZGLV'), type
			),
			(
				SELECT
					r.ID AS "IDCASE",
					CASE
						WHEN p.SMO LIKE '25%' THEN 1
						ELSE 2
						END AS "KATEG",
					1 AS "IST_FIN", -- 1 - Обязательное медицинское страхование таблица IstFin региональный
					r.ObslugId AS "PURP",
					1 AS "URGENT", -- Добавлен справочник. Иные виды помощи кроме 1 добовляются ОЧЧЧЧЕНЬ РЕДКО
					r.TypPrebId AS "TYP_PREB",
					CASE
						WHEN r.ResoltResultId IN (1, 2, 3, 4, 5)
							THEN 1 -- 1 - Выписан
						ELSE 3 -- 3 - Переведен в другое ЛПУ
						END AS RESULT_ILL,
					CASE
						WHEN r.ResoltResultId = 1 THEN 1
						WHEN r.ResoltResultId = 2 THEN 2
						WHEN r.ResoltResultId IN (3, 21, 22, 23, 24) THEN 4
						WHEN r.ResoltResultId IN (4, 18, 19, 20) THEN 3
						ELSE 3
					END AS "RESULT_TRE",
					cm.K_CHAR AS "CHAR_MAIN",
					r.VisitPolCount AS "VISIT_POL",
					r.VisitHomCount AS "VISIT_HOM",
					r.VisitDsCount AS "VISIT_DS" ,
					r.VisitHSCount AS "VISIT_HS",
					r.NSNDHOSP,
					CASE WHEN p.IsChild = 1 THEN 22 ELSE 185 END AS "SPECFIC",
					r.TypePayId AS "TYPE_PAY",
					r.KPRId AS "K_PR",
					5 AS "D_TYPE", -- Должно быть не везде. И не понятно что это
					(
						SELECT
							serv.ID AS "IDSERV",
							r.ID AS "IDCASE",
							serv.ServiceCount AS "UET_FAKT",
							'175' + '241009' AS "EXECUTOR",
							'175' + CASE WHEN p.IsChild = 1 THEN '022' ELSE '185' END AS "EX_SPEC",
							0 AS "TARIF",
							0 AS "SUMV1_USL",
							st.TERCODE AS "CODE_NOM"
							FROM dbo.FOMSServices AS serv
							JOIN dbo.FOMSServiceTypes AS st ON st.ID = serv.ServiceCodeId
							WHERE serv.StatTalon = r.ID
							FOR XML PATH ('USL'), type
					)
					FOR XML PATH ('SLUCH'), type
			)
			FROM dbo.FOMSReports AS rep
			JOIN dbo.FOMSRequests AS r ON r.ReportId = rep.ID
			JOIN dbo.Patient AS p ON p.ID = r.PatID
			LEFT JOIN dbo.FOMSCHARMAIN AS cm ON cm.ID = r.CharMainId
			WHERE rep.ID = @ReportId
			FOR XML PATH('ZL_LIST'), type
	)

	RETURN CONVERT(varchar(MAX), @PMxml)
END