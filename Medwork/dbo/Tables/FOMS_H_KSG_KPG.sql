CREATE TABLE dbo.FOMS_H_KSG_KPG
(
    Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    SlId int NOT NULL REFERENCES dbo.FOMS_H_SL(Id),
    N_KSG varchar(36) NULL,
    VER_KSG int NULL,
    KSG_PG int NULL,
    N_KPG varchar(20) NULL,
    KOEF_Z decimal NULL,
    KOEF_UP decimal NULL,
    BZTSZ decimal NULL,
    KOEF_D decimal NULL,
    KOEF_U decimal NULL,
    DKK1 varchar(20) NULL,
    DKK2 varchar(20) NULL,
    SL_K int NULL,
    IT_SL varchar(20) NULL
)