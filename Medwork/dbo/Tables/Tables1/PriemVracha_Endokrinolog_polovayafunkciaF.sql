CREATE TABLE [dbo].[PriemVracha_Endokrinolog_polovayafunkciaF] (
    [ID]                            INT   NOT NULL,
    [PatID]                         INT   NULL,
    [menarhe_polovayafunc]          INT   NULL,
    [menstrualniycikl_polovayafunc] INT   NULL,
    [menopausa_polovayafunc]        INT   NULL,
    [rodi_polovayafunc]             NTEXT NULL,
    [berebenosti_polovayafunc]      NTEXT NULL,
    CONSTRAINT [PriemVracha_Endokrinolog_polovayafunkciaFPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Endokrinolog_polovayafunkciaFToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

