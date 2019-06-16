CREATE TABLE [dbo].[BiopsiyaTsitologiyaGistologiya] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [Issledovanie]             INT           NULL,
    [Biopsiya]                 INT           NULL,
    [ZaklyucheniePoBiopsii]    NTEXT         NULL,
    [Gistologiya]              INT           NULL,
    [ZaklyucheniePoGistologii] NTEXT         NULL,
    [ZaklyucheniePoTsitologii] NTEXT         NULL,
    [Tsitologiya]              INT           NULL,
    [Data]                     DATETIME      NULL,
    [Laborant]                 NVARCHAR (50) NULL,
    CONSTRAINT [BiopsiyaTsitologiyaGistologiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BiopsiyaTsitologiyaGistologiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

