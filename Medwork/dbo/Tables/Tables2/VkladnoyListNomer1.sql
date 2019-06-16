CREATE TABLE [dbo].[VkladnoyListNomer1] (
    [ID]          INT        NOT NULL,
    [PatID]       INT        NULL,
    [MasterID]    INT        NULL,
    [Data]        DATETIME   NULL,
    [Chas]        FLOAT (53) NULL,
    [Sostoyanie]  NTEXT      NULL,
    [Primechanie] NTEXT      NULL,
    CONSTRAINT [VkladnoyListNomer1PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VkladnoyListNomer1ToTechenieBeremennostiRodovVkladnoyListNomer1] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[TechenieBeremennostiRodovVkladnoyListNomer1] ([ID]) ON DELETE CASCADE
);

