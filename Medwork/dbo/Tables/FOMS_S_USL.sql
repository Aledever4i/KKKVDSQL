﻿CREATE TABLE dbo.FOMS_S_USL
(
    Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    FOMS_S_SL_ID int NOT NULL,
    IDSERV varchar(36) NULL,
    PR_USL varchar(40) NULL
)