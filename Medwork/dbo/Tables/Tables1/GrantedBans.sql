CREATE TABLE dbo.GrantedBans
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    BanId int NOT NULL REFERENCES dbo.Bans(Id),
    UserId int NOT NULL REFERENCES dbo.Usr(ID)
)
