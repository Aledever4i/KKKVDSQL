CREATE PROCEDURE dbo.UsrList
AS
BEGIN
    SELECT
        usr.ID,
        usr.AltID,
        usr.FirstName,
        usr.CardNum
        FROM dbo.Usr AS usr
        WHERE usr.IsMedPersonnel = 1
        ORDER BY usr.AltID ASC
END
