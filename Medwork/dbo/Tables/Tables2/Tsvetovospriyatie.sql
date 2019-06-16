CREATE TABLE [dbo].[Tsvetovospriyatie] (
    [ID]    INT           NOT NULL,
    [PatID] INT           NULL,
    [CVET]  NVARCHAR (30) NULL,
    [Prim]  NTEXT         NULL,
    CONSTRAINT [TsvetovospriyatiePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TsvetovospriyatieToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

