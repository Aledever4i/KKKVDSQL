CREATE PROCEDURE [dbo].[Отчет для Зав Поликлиники]
(	
	@ReportDateStart date,
	@ReportDateEnd date
)



AS
BEGIN
  SELECT Usr.lastname,
	count(Usr.lastname)

	FROM [dbo].[Napravlenie] left join usr on Registrator=Usr.id
	where FinanceSourceId=3
	and DataPriema>=@ReportDateStart
	and DataPriema<=@ReportDateEnd
	group by Usr.lastname
	order by Usr.lastname
END