CREATE TABLE [dbo].[FotografiyaGlaznogoDna] (
    [ID]          INT   NOT NULL,
    [PatID]       INT   NULL,
    [ODImage]     IMAGE NULL,
    [primechanie] NTEXT NULL,
    [OSImage]     IMAGE NULL,
    CONSTRAINT [FotografiyaGlaznogoDnaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FotografiyaGlaznogoDnaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

