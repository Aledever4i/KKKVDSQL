CREATE PROCEDURE dbo.BanDelete
    @BanId int,
    @UserId int
AS
BEGIN
    DELETE FROM dbo.GrantedBans WHERE BanId = @BanId AND UserId = @UserId
END