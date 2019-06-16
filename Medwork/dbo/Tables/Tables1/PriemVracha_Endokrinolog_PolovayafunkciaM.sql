CREATE TABLE [dbo].[PriemVracha_Endokrinolog_PolovayafunkciaM] (
    [ID]                    INT           NOT NULL,
    [PatID]                 INT           NULL,
    [Ovolosenie]            NVARCHAR (80) NULL,
    [Girsutnoechislo]       INT           NULL,
    [Libido]                NVARCHAR (80) NULL,
    [Erekilnayadizfunkciya] NVARCHAR (80) NULL,
    CONSTRAINT [PriemVracha_Endokrinolog_PolovayafunkciaMPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Endokrinolog_PolovayafunkciaMToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

