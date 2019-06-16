CREATE TABLE [dbo].[Interpretation] (
    [ID]                                      INT            NOT NULL,
    [CaptionDoc]                              NVARCHAR (255) NULL,
    [Description]                             NTEXT          NULL,
    [TableName]                               NVARCHAR (255) NULL,
    [NeVivoditZnacheniyaParametrovVDokumente] NVARCHAR (1)   NULL,
    CONSTRAINT [InterpretationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

