CREATE PROCEDURE dbo.EMRGetAmbulatoryVisits
	@FOMSRequestId int
AS
BEGIN
	SELECT
		*
		FROM dbo.FOMSVisitsView AS vv
		WHERE vv.StatTalon = @FOMSRequestId
END