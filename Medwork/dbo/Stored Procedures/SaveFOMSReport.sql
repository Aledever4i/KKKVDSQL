CREATE PROCEDURE [dbo].[SaveFOMSReport]
	@ReportId int
AS
BEGIN
	-- Формирование выгрузок стат талона
	UPDATE rep
		SET 
			HM = dbo.FOMSGetHMReport(Rep.ID),
			LM = dbo.FOMSGetLMReport(Rep.ID),
			PM = dbo.FOMSGetPMReport(Rep.ID),
			EditStamp = GETDATE()
		FROM dbo.FOMSReports AS rep
		WHERE rep.ID = @ReportId
END