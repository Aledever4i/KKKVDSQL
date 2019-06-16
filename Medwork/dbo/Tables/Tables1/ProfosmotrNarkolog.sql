CREATE TABLE [dbo].[ProfosmotrNarkolog] (
    [ID]             INT            NOT NULL,
    [PatID]          INT            NULL,
    [Data]           DATETIME       NULL,
    [Vrach]          INT            NULL,
    [Zaklyuchenie]   NVARCHAR (100) NULL,
    [Kommentrariy]   NTEXT          NULL,
    [Recommendation] NTEXT          NULL,
    CONSTRAINT [ProfosmotrNarkologPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProfosmotrNarkologToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

