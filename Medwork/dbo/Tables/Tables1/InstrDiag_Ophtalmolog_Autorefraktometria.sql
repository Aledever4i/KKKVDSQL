﻿CREATE TABLE [dbo].[InstrDiag_Ophtalmolog_Autorefraktometria] (
    [ID]                      INT           NOT NULL,
    [PatID]                   INT           NULL,
    [AutorefSph_OD1]          FLOAT (53)    NULL,
    [AutorefCyl_OD1]          FLOAT (53)    NULL,
    [AutorefAx_OD1]           INT           NULL,
    [AutorefSph_OD12]         FLOAT (53)    NULL,
    [AutorefCyl_OD4]          FLOAT (53)    NULL,
    [AutorefAx_OD4]           INT           NULL,
    [AutorefAx_OD3]           INT           NULL,
    [AutorefCyl_OD3]          FLOAT (53)    NULL,
    [AutorefSph_OD11]         FLOAT (53)    NULL,
    [AutorefAx_OD2]           INT           NULL,
    [AutorefCyl_OD2]          FLOAT (53)    NULL,
    [AutorefSph_OD2]          FLOAT (53)    NULL,
    [plusminusuzkizrachokOD]  NVARCHAR (50) NULL,
    [plusminuscycloplegeyaOD] NVARCHAR (50) NULL,
    [plusminusuzkizrachokOS]  NVARCHAR (50) NULL,
    [plusminuscycloplegeyaOS] NVARCHAR (50) NULL,
    [MasterID]                INT           NULL,
    [Prim]                    NTEXT         NULL,
    CONSTRAINT [InstrDiag_Ophtalmolog_AutorefraktometriaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_Ophtalmolog_AutorefraktometriaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

