CREATE TABLE [dbo].[InstrDiag_Ophtalmolog_Keratometria] (
    [ID]             INT        NOT NULL,
    [PatID]          INT        NULL,
    [AutorefSph_OD3] FLOAT (53) NULL,
    [AutorefSph_OD4] FLOAT (53) NULL,
    [AutorefSph_OD5] FLOAT (53) NULL,
    [AutorefSph_OD8] FLOAT (53) NULL,
    [ax1]            INT        NULL,
    [ax2]            INT        NULL,
    [ax3]            INT        NULL,
    [ax4]            INT        NULL,
    [MasterID]       INT        NULL,
    [Prim]           NTEXT      NULL,
    CONSTRAINT [InstrDiag_Ophtalmolog_KeratometriaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_Ophtalmolog_KeratometriaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

