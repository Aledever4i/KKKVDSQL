CREATE TABLE [dbo].[ListZapisiZaklyuchitelnihUtochnNnihDiagnozov] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [ListZapisiZaklyuchitelnihUtochnNnihDiagnozovPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ListZapisiZaklyuchitelnihUtochnNnihDiagnozovToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

