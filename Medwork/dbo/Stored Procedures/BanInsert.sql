CREATE PROCEDURE dbo.BanInsert
    @BanId int,
    @UserId int
AS
BEGIN
    INSERT INTO dbo.GrantedBans (BanId, UserId) VALUES (@BanId, @UserId)
END
