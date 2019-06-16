CREATE TABLE [dbo].[Sich] (
    [ID]                 INT      NOT NULL,
    [PatID]              INT      NULL,
    [NomerIssledovaniya] INT      NULL,
    [DataIssledovanie]   DATETIME NULL,
    [Vrach]              INT      NULL,
    [Kommentariy]        NTEXT    NULL,
    [Zaklyuchenie]       NTEXT    NULL,
    CONSTRAINT [SichPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SichToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

