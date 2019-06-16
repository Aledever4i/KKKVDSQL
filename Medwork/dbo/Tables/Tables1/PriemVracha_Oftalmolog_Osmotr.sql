CREATE TABLE [dbo].[PriemVracha_Oftalmolog_Osmotr] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [PriemVracha_Oftalmolog_OsmotrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Oftalmolog_OsmotrToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

