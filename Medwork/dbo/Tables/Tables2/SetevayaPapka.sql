CREATE TABLE [dbo].[SetevayaPapka] (
    [ID]         INT   NOT NULL,
    [PatID]      INT   NULL,
    [FolderPath] NTEXT NULL,
    CONSTRAINT [SetevayaPapkaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SetevayaPapkaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

