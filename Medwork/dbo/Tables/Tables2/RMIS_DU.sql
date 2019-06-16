CREATE TABLE [dbo].[RMIS_DU] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [PATIENT]  NVARCHAR (36) NULL,
    [Q_PASP]   NVARCHAR (2)  NULL,
    [S_PASP]   NVARCHAR (16) NULL,
    [SN_PASP]  NVARCHAR (16) NULL,
    [DAT_DUL]  DATETIME      NULL,
    [CHD]      DATETIME      NULL,
    CONSTRAINT [RMIS_DUPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

