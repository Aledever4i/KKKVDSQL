CREATE TABLE [dbo].[InstrDiag_Ophtalmolog_Tonometria] (
    [ID]            INT   NOT NULL,
    [PatID]         INT   NULL,
    [Tonometria_OD] INT   NULL,
    [Tonometria_OS] INT   NULL,
    [Prim]          NTEXT NULL,
    CONSTRAINT [InstrDiag_Ophtalmolog_TonometriaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_Ophtalmolog_TonometriaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

