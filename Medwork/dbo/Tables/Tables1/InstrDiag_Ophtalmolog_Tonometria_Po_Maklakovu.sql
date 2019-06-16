CREATE TABLE [dbo].[InstrDiag_Ophtalmolog_Tonometria_Po_Maklakovu] (
    [ID]          INT      NOT NULL,
    [PatID]       INT      NULL,
    [VGDD]        INT      NULL,
    [VGDS]        INT      NULL,
    [Prim]        NTEXT    NULL,
    [RecNo]       INT      NULL,
    [RecNo1]      INT      NULL,
    [ExportTime]  DATETIME NULL,
    [ExportTime1] DATETIME NULL,
    CONSTRAINT [InstrDiag_Ophtalmolog_Tonometria_Po_MaklakovuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_Ophtalmolog_Tonometria_Po_MaklakovuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

