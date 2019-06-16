CREATE TABLE [dbo].[PriemVracha_Ortopedatravmatolog] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [PriemVracha_OrtopedatravmatologPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_OrtopedatravmatologToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

