CREATE FUNCTION [dbo].[FOMSIsFirstResolt] 
(
	@PatId int,
	@Id int
)
RETURNS bit
AS
BEGIN
	DECLARE
		@Year int
		
	SELECT
		@Year = DATEPART(YEAR, r.HealingStartDate)
		FROM dbo.FOMSRequests AS r
		WHERE r.ID = @Id

	RETURN
		CASE
			WHEN NOT EXISTS (
				SELECT
					*
					FROM dbo.FOMSRequests AS r
					WHERE 
						r.PatID = @PatId
						AND DATEPART(YEAR, r.HealingStartDate) = @Year
					GROUP BY 
						r.FinalSickDictId,
						r.TargetResoltId
					HAVING COUNT(*) > 1
			) THEN 1
			ELSE 0
			END
END