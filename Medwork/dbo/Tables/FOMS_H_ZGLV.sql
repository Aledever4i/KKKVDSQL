CREATE TABLE dbo.FOMS_H_ZGLV
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    ZlId int NOT NULL REFERENCES dbo.FOMS_H_ZL_LIST(Id),
    [VERSION] varchar(3) NULL,
    [DATA] date NULL,
    [FILENAME] varchar(20) NULL,
    SD_Z int NULL
)