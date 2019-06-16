CREATE TABLE [dbo].[RMIS_PR] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [PATIENT]  NVARCHAR (36) NULL,
    [ID_P]     NVARCHAR (36) NULL,
    [STAT_P]   NVARCHAR (2)  NULL,
    [CHD]      DATETIME      NULL,
    CONSTRAINT [RMIS_PRPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

