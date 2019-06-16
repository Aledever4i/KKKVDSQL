CREATE TABLE dbo.FOMS_V_SL
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    FOMS_V_ZAP_ID int NOT NULL,
    SL_ID varchar(36) NULL,
    IDCASE varchar(36) NULL,
    NHISTORY varchar(36) NULL,
    CARD varchar(36) NULL,
    SMO varchar(36) NULL,
    SMO_FOND varchar(36) NULL
)
