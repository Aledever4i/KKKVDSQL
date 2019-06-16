CREATE TABLE [dbo].[Avtokeratometriya] (
    [ID]          INT        NOT NULL,
    [PatID]       INT        NULL,
    [DK2D]        FLOAT (53) NULL,
    [AX2D]        INT        NULL,
    [AX1D]        INT        NULL,
    [DK1D]        FLOAT (53) NULL,
    [AX1S]        INT        NULL,
    [DK1S]        FLOAT (53) NULL,
    [DK2S]        FLOAT (53) NULL,
    [AX2S]        INT        NULL,
    [Primechanie] NTEXT      NULL,
    [RecNo]       INT        NULL,
    [ExportTime]  DATETIME   NULL,
    [KTYPE]       INT        NULL,
    CONSTRAINT [AvtokeratometriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AvtokeratometriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

