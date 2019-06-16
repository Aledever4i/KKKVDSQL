CREATE TABLE [dbo].[Fotoalbom] (
    [ID]     INT   NOT NULL,
    [PatID]  INT   NULL,
    [Image1] IMAGE NULL,
    [Memo1]  NTEXT NULL,
    CONSTRAINT [FotoalbomPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FotoalbomToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

