CREATE TABLE [dbo].[InstrDiag_Ophtalmolog_Pahimetria] (
    [ID]       INT        NOT NULL,
    [PatID]    INT        NULL,
    [PahimOS]  FLOAT (53) NULL,
    [PahimOD]  FLOAT (53) NULL,
    [MasterID] INT        NULL,
    [Prim]     NTEXT      NULL,
    CONSTRAINT [InstrDiag_Ophtalmolog_PahimetriaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_Ophtalmolog_PahimetriaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

