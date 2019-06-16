CREATE TABLE [dbo].[FotografiyaPerednegoOtrezkaGlaza] (
    [ID]          INT   NOT NULL,
    [PatID]       INT   NULL,
    [ODImage]     IMAGE NULL,
    [OSImage]     IMAGE NULL,
    [primechanie] NTEXT NULL,
    CONSTRAINT [FotografiyaPerednegoOtrezkaGlazaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FotografiyaPerednegoOtrezkaGlazaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

