CREATE PROCEDURE [dbo].[FOMSAddRequestsToReport] 
	@ReportId int,
	@StartDate varchar(10),
	@EndDate varchar(10)
AS
BEGIN
	-- Добавление посещений в стат талон
	UPDATE req
		SET ReportId = @ReportId
		FROM dbo.FOMSRequests AS req
		WHERE req.ID IN (
			SELECT RequestId FROM dbo.FOMSGetFreeRequests(@StartDate, @EndDate)
		)	
END

