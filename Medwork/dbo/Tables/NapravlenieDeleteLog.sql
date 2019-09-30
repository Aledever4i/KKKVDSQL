CREATE TABLE dbo.NapravlenieDeleteLog
(
	Id int NOT NULL PRIMARY KEY CLUSTERED IDENTITY(1, 1),
	[User] sysname NULL,
	NapravlenieId int NOT NULL
)
