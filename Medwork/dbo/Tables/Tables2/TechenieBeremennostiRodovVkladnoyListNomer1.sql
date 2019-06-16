CREATE TABLE [dbo].[TechenieBeremennostiRodovVkladnoyListNomer1] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [TechenieBeremennostiRodovVkladnoyListNomer1PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TechenieBeremennostiRodovVkladnoyListNomer1ToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

