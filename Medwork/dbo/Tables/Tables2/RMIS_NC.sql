CREATE TABLE [dbo].[RMIS_NC] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [NC_COD]   NVARCHAR (4)  NULL,
    [NC_VER]   NVARCHAR (50) NULL,
    CONSTRAINT [RMIS_NCPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

