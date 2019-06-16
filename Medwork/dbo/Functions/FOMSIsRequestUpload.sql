CREATE FUNCTION dbo.FOMSIsRequestUpload
(
	@RecId int
)
RETURNS bit
AS
BEGIN
	DECLARE @IsUpload bit
	
	SELECT
		@IsUpload = ISNULL(rep.IsClose, 0)
		FROM dbo.FOMSRequests AS req
		LEFT JOIN dbo.FOMSReports AS rep ON rep.ID = req.ReportId
		WHERE req.ID = @RecId
		
	RETURN @IsUpload
END

