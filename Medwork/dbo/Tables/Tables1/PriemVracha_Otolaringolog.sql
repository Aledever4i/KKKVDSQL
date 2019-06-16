CREATE TABLE [dbo].[PriemVracha_Otolaringolog] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [PriemVracha_OtolaringologPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_OtolaringologToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

