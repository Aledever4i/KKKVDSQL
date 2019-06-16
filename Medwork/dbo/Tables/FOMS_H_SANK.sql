CREATE TABLE dbo.FOMS_H_SANK
(
    Id int NOT NULL PRIMARY KEY,
    SlId int NOT NULL REFERENCES dbo.FOMS_H_SL(Id),
    S_CODE varchar(36) NULL,
    S_SUM decimal NULL,
    S_TIP int NULL,
    S_OSN int NULL,
    S_COM varchar(250) NULL,
    S_IST int NULL
)