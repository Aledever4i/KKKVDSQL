CREATE TABLE [dbo].[Foto] (
    [ID]    INT   NOT NULL,
    [PatID] INT   NULL,
    [Image] IMAGE NULL,
    CONSTRAINT [FotoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FotoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

