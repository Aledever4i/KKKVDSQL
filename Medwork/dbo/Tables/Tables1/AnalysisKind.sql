CREATE TABLE [dbo].[AnalysisKind] (
    [ID]        INT            NOT NULL,
    [Comment]   NVARCHAR (256) NULL,
    [Name]      NVARCHAR (256) NULL,
    [BriefName] NVARCHAR (256) NULL,
    [Material]  NVARCHAR (256) NULL,
    CONSTRAINT [PK_AnalysisKind] PRIMARY KEY CLUSTERED ([ID] ASC)
);

