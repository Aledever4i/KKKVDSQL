﻿CREATE TABLE [dbo].[FOMSV014] (
    [RecId]     INT            IDENTITY (1, 1) NOT NULL,
    [IDFRMMP]   INT            NOT NULL,
    [FRMMPNAME] VARCHAR (1000) NOT NULL,
    [DATEBEG]   DATE           NOT NULL,
    [DATEEND]   DATE           NULL,
    CONSTRAINT [PK_V014] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

