CREATE FUNCTION [dbo].[FOMSGetReportName](@ReportId int)
RETURNS varchar(30)
AS
BEGIN
	DECLARE @Result varchar(30)
	
	SELECT
		@Result = 'M250175T25_' + RIGHT(DATEPART(YEAR, GETDATE()), 2) + RIGHT('0' + DATEPART(MONTH, GETDATE()), 2) + '175' + '1' + '___' + CAST(@ReportId AS varchar(10))
		FROM dbo.FOMSReports AS rep
		WHERE rep.ID = @ReportId

	RETURN @Result
END