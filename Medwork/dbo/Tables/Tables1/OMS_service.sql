CREATE TABLE [dbo].[OMS_service] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [Name]     NVARCHAR (80) NULL,
    [Code]     INT           NULL,
    [Type]     NVARCHAR (1)  NULL,
    [Days]     SMALLINT      NULL,
    [MDays]    SMALLINT      NULL,
    [W]        SMALLINT      NULL,
    [Price]    FLOAT (53)    NULL,
    [MOPrice]  FLOAT (53)    NULL,
    [UET_VR]   FLOAT (53)    NULL,
    [UET_MS]   FLOAT (53)    NULL,
    [SKORP]    BIT           NOT NULL,
    [FED]      SMALLINT      NULL,
    [ERRUPD]   BIT           NOT NULL,
    [Hidden]   BIT           NULL,
    CONSTRAINT [PK_OMS_service] PRIMARY KEY CLUSTERED ([ID] ASC)
);

