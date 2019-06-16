CREATE TABLE [dbo].[MNTK_Krasn_Globspr] (
    [ID]     INT           NOT NULL,
    [Code]   NVARCHAR (3)  NULL,
    [Name]   NVARCHAR (50) NULL,
    [Source] NVARCHAR (8)  NULL,
    CONSTRAINT [MNTK_Krasn_GlobsprPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

