CREATE TABLE [dbo].[PriemVracha_Terapevt] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [PriemVracha_TerapevtPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_TerapevtToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

