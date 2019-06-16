CREATE TABLE [dbo].[PovtorniyPriMGastroenterologa] (
    [ID]                         INT      NOT NULL,
    [PatID]                      INT      NULL,
    [Data]                       DATETIME NULL,
    [Vrach]                      INT      NULL,
    [ObektivniyStatus1]          NTEXT    NULL,
    [SosudiVerhnihKonechnostey1] NTEXT    NULL,
    [SosudiNizhnihKonechnostey1] NTEXT    NULL,
    CONSTRAINT [PovtorniyPriMGastroenterologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMGastroenterologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

