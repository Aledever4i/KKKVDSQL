CREATE PROCEDURE dbo.GSUserScheduleInfo
	@UsrId int
AS
BEGIN
	SELECT
		u.ID,
		u.LastName,
		u.SecondName,
		u.FirstName,
		'' AS SNILS,
		u.FOMSProfessionId,
		u.Specialitie
		FROM dbo.Usr AS u
		WHERE u.ID = @UsrId
END