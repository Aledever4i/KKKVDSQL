CREATE TABLE dbo.FOMS_S_SL
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    SL_ID varchar(36) NULL,
    IDCASE varchar(36) NULL,
    NSNDHOSP varchar(10) NULL,
    REN int NULL,
    SOFA varchar(10) NULL, -- Определить тип
    PARENT int NULL,
    D_TYPE varchar(3) NULL,
    FROM_FIRM varchar(3) NULL,
    DS1_M varchar(MAX) NULL -- Определить тип
)
