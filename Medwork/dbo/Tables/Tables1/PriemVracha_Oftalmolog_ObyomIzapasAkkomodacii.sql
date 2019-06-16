CREATE TABLE [dbo].[PriemVracha_Oftalmolog_ObyomIzapasAkkomodacii] (
    [ID]       INT        NOT NULL,
    [PatID]    INT        NULL,
    [ppOD]     FLOAT (53) NULL,
    [ppOS]     FLOAT (53) NULL,
    [prOD]     FLOAT (53) NULL,
    [prOS]     FLOAT (53) NULL,
    [Polozhit] FLOAT (53) NULL,
    [Otricat]  FLOAT (53) NULL,
    [pp-pr]    FLOAT (53) NULL,
    [ppprOS]   FLOAT (53) NULL,
    CONSTRAINT [PriemVracha_Oftalmolog_ObyomIzapasAkkomodaciiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Oftalmolog_ObyomIzapasAkkomodaciiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

