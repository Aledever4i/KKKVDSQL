CREATE TABLE dbo.FOMS_S_RL
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    FOMS_S_USL_ID int NOT NULL REFERENCES dbo.FOMS_S_USL(Id),
    IDRL varchar(36) NULL,
    NAME_MNN varchar(40) NULL,
    ID_ATX varchar(40) NULL,
    ID_MI varchar(40) NULL,
    KOL_MI int NULL
)
