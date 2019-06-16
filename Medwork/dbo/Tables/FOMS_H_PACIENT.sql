CREATE TABLE dbo.FOMS_H_PACIENT
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    ZapId int NOT NULL REFERENCES dbo.FOMS_H_ZAP(Id),
    ID_PAC varchar(36) NULL,
    VPOLIS int NULL,
    SPOLIS varchar(10) NULL,
    NPOLIS varchar(20) NULL,
    ST_OKATO varchar(5) NULL,
    SMO varchar(5) NULL,
    SMO_OGRN varchar(15) NULL,
    SMO_OK varchar(5) NULL,
    SMO_NAM varchar(100) NULL,
    INV varchar(10) NULL,
    MSE varchar(10) NULL,
    NOVOR varchar(9) NULL,
    VNOV_D int NULL
)