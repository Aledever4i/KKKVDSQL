CREATE FUNCTION [dbo].[отчет для овчинниковой]

(	
	@ReportDateStart date,
	@ReportDateEnd date
)
RETURNS @Report table
(
 [поле в мониторинге] varchar(MAX),
 [значение] varchar(MAX)
) 


AS
BEGIN

	INSERT INTO @Report
	SELECT
	'Общее количество обратившихся в поликлинику' as [поле в мониторинге],
(
(
		select 
		count(*)
		from Napravlenie as n
		where n.DataNapravleniya >= @ReportDateStart and n.DataNapravleniya < @ReportDateEnd
)
+
(	
			SELECT
				ISNULL(
					SUM(
						CASE
						WHEN s.LastName <> '' THEN
							1
						ELSE
							0
						END
					),
					0
				)
			FROM
				SpisokZvonkov AS s
			WHERE
				s.datapriema >= @ReportDateStart
			AND s.datapriema < @ReportDateEnd
			AND s.ShowInSchedule = 1
)
+
(			
			SELECT
				ISNULL(
					SUM(
						CASE
						WHEN m.Name1 <> '' THEN
							1
						ELSE
							0
						END
					),
					0
				) 
			FROM
				MedihostOrder AS m
			WHERE
				CAST(m.Reception_Datetime AS DATE)>= @ReportDateStart
			AND CAST(m.Reception_Datetime AS DATE)< @ReportDateEnd
			AND m.ShowInSchedule = 1
)) as [значение]


	INSERT INTO @Report
			SELECT
				'Количество пациентов, на которых в МИС заведены ЭМК (регистратура)' as [поле в мониторинге],
				count(*) as [значение]
			FROM
				selectpatients AS s
			WHERE
				s.DATE >= @ReportDateStart
			AND s.DATE < @ReportDateEnd
			AND s.ActionID = 1

	INSERT INTO @Report
			select
				'Количество ЭМК по которым в МИС велись врачебные записи (осмотры, дневники, эпикризы)' as [поле в мониторинге],
				count(*) as [значение]
			FROM
			(
			SELECT 
				count(*) as cnt
			FROM
				patform as p
			WHERE
				p.FormID <> 18079
			AND
				p.createtime >=@ReportDateStart
			AND
				p.createtime <@ReportDateEnd
			GROUP BY
			p.patID
			) as z

	INSERT INTO @Report
			SELECT
				'Количество случаев записи на прием к врачу в электронном виде' as [поле в мониторинге],
				count(*) as [значение]
			FROM
				dbo.MedihostOrder AS mo
			WHERE
				mo.order_date >= @ReportDateStart
			AND mo.order_date < @ReportDateEnd

	INSERT INTO @Report
			SELECT
				'Количество пациентов, поступивших в приёмное отделение' as [поле в мониторинге],
				count(*) as [значение]
			FROM
				forma001 AS f
			WHERE
				f.ДАТА >= @ReportDateStart
			AND f.ДАТА < @ReportDateEnd
	
	INSERT INTO @Report
			SELECT
				'Количество пациентов, на которых в МИС заведена ЭМК (приёмное отделение)' as [поле в мониторинге],
				count(*) as [значение]
			FROM
				TitulniyListF003U AS t
			WHERE
				t.dataivremyapostupleniya >= @ReportDateStart
			AND t.dataivremyapostupleniya < @ReportDateEnd
	RETURN
END
