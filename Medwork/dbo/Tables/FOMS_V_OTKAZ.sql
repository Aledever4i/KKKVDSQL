﻿CREATE TABLE dbo.FOMS_V_OTKAZ
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    FOMS_V_SL_ID int NOT NULL,
    I_TYPE varchar(36) NULL,
    COMMENT varchar(250) NULL
)