CREATE PROCEDURE dbo.UsrGetBans
    @UsrId int
AS
BEGIN
    SELECT
        ban.Id AS BanId,
        ban.Descr,
        CASE WHEN gb.Id IS NOT NULL THEN 'Запрещено' ELSE 'Разрешено' END AS HasBan
        FROM dbo.Bans AS ban
        LEFT JOIN dbo.GrantedBans AS gb ON gb.BanId = ban.Id AND gb.UserId = @UsrId
        ORDER BY ban.Descr ASC
END
