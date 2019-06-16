CREATE FUNCTION [dbo].[GetInternetOrderCountOnOrderDate]
(
	@ReportDate date
)
RETURNS table
AS
RETURN (
	SELECT
		CAST(mo.order_date as date) as orddate,
		DATENAME(dw, CAST(mo.order_date as date)) AS ReportDateName,
		COUNT(mo.order_date) AS OrderCount
		FROM dbo.MedihostOrder AS mo
		WHERE 
			mo.order_date >= @ReportDate
		GROUP BY 
			CAST(mo.order_date as date)
)