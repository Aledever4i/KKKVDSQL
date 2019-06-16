CREATE TABLE dbo.FOMS_H_SCHET
(
    Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    ZlId int NOT NULL REFERENCES dbo.FOMS_H_ZL_LIST(Id),
    CODE int NULL,
    CODE_MO varchar(6) NULL,
    [YEAR] int NULL,
    [MONTH] int NULL,
    NSCHET varchar(15) NULL,
    DSCHET date NULL,
    PLAT varchar(5) NULL,
    SUMMAV decimal NULL,
    COMENTS decimal NULL,
    SUMMAP decimal NULL,
    SANK_MEK decimal NULL,
    SANK_MEE decimal NULL,
    SANK_EKMP decimal NULL
)