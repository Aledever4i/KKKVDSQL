CREATE TABLE [dbo].[Issledovaniya] (
    [ID]                INT      NOT NULL,
    [PatID]             INT      NULL,
    [MasterID]          INT      NULL,
    [Data]              DATETIME NULL,
    [Kontsentratsiya]   INT      NULL,
    [Doza]              INT      NULL,
    [MestnayaReaktsiya] NTEXT    NULL,
    [ObshayaReaktsiya]  NTEXT    NULL,
    [Primechanie]       NTEXT    NULL,
    CONSTRAINT [IssledovaniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IssledovaniyaToSvedeniyaOSpetsificheskoyImmunoterapii] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[SvedeniyaOSpetsificheskoyImmunoterapii] ([ID]) ON DELETE CASCADE
);

