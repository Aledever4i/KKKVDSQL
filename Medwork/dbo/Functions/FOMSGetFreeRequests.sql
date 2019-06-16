CREATE FUNCTION [dbo].[FOMSGetFreeRequests]
(
	@StartDate varchar(10),
	@EndDate varchar(10)
)
RETURNS @Requests TABLE 
(
	RequestId int
)
AS
BEGIN
	DECLARE
		@CastStartDate date = CASE 
			WHEN @StartDate = '' THEN NULL
			ELSE CONVERT(date, @StartDate, 104)
			END,
		@CastEndDate date = CASE 
			WHEN @EndDate = '' THEN NULL
			ELSE CONVERT(date, @EndDate, 104)
			END
	
	INSERT INTO @Requests (
		RequestId
		)
		SELECT
			req.ID
			FROM dbo.FOMSRequests AS req
			LEFT JOIN dbo.FOMSReports AS rep ON rep.ID = req.ReportId
			WHERE
				(req.ReportId IS NULL OR ISNULL(rep.IsActive, 0) = 0)
				AND (@CastStartDate IS NULL OR req.HealingEndDate >= @CastStartDate)
				AND (@CastEndDate IS NULL OR req.HealingEndDate <= @CastEndDate)
				AND req.FinanceSourceId = 1
	
	RETURN 
END