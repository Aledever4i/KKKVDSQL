CREATE TABLE [dbo].[Keratopahimetriya] (
    [ID]         INT      NOT NULL,
    [PatID]      INT      NULL,
    [CD]         INT      NULL,
    [A1D]        INT      NULL,
    [B1D]        INT      NULL,
    [A2D]        INT      NULL,
    [B2D]        INT      NULL,
    [A3D]        INT      NULL,
    [B3D]        INT      NULL,
    [A1S]        INT      NULL,
    [B1S]        INT      NULL,
    [B2S]        INT      NULL,
    [A2S]        INT      NULL,
    [A3S]        INT      NULL,
    [B3S]        INT      NULL,
    [CS]         INT      NULL,
    [Prim]       NTEXT    NULL,
    [RecNo]      INT      NULL,
    [ExportTime] DATETIME NULL,
    CONSTRAINT [KeratopahimetriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KeratopahimetriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

