CREATE TABLE [dbo].[InstrDiag_Ophtalmolog_Biometria] (
    [ID]          INT        NOT NULL,
    [PatID]       INT        NULL,
    [KameraOD]    FLOAT (53) NULL,
    [KameraOS]    FLOAT (53) NULL,
    [HrustalikOD] FLOAT (53) NULL,
    [HrustalikOS] FLOAT (53) NULL,
    [DlinaOD]     FLOAT (53) NULL,
    [DlinaOS]     FLOAT (53) NULL,
    [MasterID]    INT        NULL,
    [Prim]        NTEXT      NULL,
    CONSTRAINT [InstrDiag_Ophtalmolog_BiometriaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_Ophtalmolog_BiometriaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

