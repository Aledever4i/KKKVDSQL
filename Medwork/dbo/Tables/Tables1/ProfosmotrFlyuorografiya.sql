CREATE TABLE [dbo].[ProfosmotrFlyuorografiya] (
    [ID]             INT            NOT NULL,
    [PatID]          INT            NULL,
    [Data]           DATETIME       NULL,
    [Vrach]          INT            NULL,
    [Zaklyuchenie]   NVARCHAR (100) NULL,
    [Kommentrariy]   NTEXT          NULL,
    [Num]            INT            NULL,
    [DateSnimka]     DATETIME       NULL,
    [Recommendation] NTEXT          NULL,
    CONSTRAINT [ProfosmotrFlyuorografiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProfosmotrFlyuorografiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

