CREATE TABLE [dbo].[ListZaklDiag] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [ListZaklDiagPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ListZaklDiagToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

