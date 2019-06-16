CREATE FUNCTION [dbo].[GetInternetOrderCountOnResourceAndReceptionDate]
(
	@ReportDate date
)
RETURNS table
AS
RETURN (
	SELECT
		mo.ReceptionDate,
		mo.Name,
		COUNT(*) AS OrderCount
		FROM (
			SELECT
				CAST(mo_.Reception_Datetime AS date) AS ReceptionDate,
				usr_.Name
				FROM dbo.MedihostOrder AS mo_
				JOIN dbo.ResourcesView AS usr_ ON usr_.ID = mo_.MW_Resource_ID
				WHERE mo_.Reception_Datetime >= @ReportDate
		) AS mo
		GROUP BY
			mo.ReceptionDate,
			mo.Name	
)