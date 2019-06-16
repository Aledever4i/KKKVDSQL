CREATE TABLE dbo.FOMS_H_USL
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    SlId int NOT NULL REFERENCES dbo.FOMS_H_SL(Id),
    IDSERV varchar(36) NULL,
    LPU varchar(6) NULL,
    LPU_1 varchar(8) NULL,
    PODR int NULL,
    PROFIL int NULL,
    VID_VME varchar(15) NULL,
    DET int NULL,
    DATE_IN date NULL,
    DATE_OUT date NULL,
    DS varchar(10) NULL,
    CODE_USL varchar(20) NULL,
    KOL_USL decimal NULL,
    TARIF decimal NULL,
    SUMV_USL decimal NULL,
    PRVS int NULL,
    CODE_MD varchar(20) NULL,
    NPL varchar(20) NULL,
    COMENTU varchar(100) NULL
)