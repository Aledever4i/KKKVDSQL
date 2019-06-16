﻿CREATE TABLE [dbo].[LaboratoryTests] (
    [ID]                           INT           NOT NULL,
    [PatID]                        INT           NULL,
    [Kreatinin]                    FLOAT (53)    NULL,
    [Mochevina]                    FLOAT (53)    NULL,
    [Kaltsiy]                      FLOAT (53)    NULL,
    [Natriy]                       FLOAT (53)    NULL,
    [Hlor]                         FLOAT (53)    NULL,
    [Fosfor]                       FLOAT (53)    NULL,
    [Zhelezo]                      FLOAT (53)    NULL,
    [KaliyVPlazme]                 FLOAT (53)    NULL,
    [Gemoglobin]                   FLOAT (53)    NULL,
    [Gematokrit]                   FLOAT (53)    NULL,
    [Leykotsiti]                   FLOAT (53)    NULL,
    [Eritrotsiti]                  FLOAT (53)    NULL,
    [Trombotsiti]                  FLOAT (53)    NULL,
    [MochevinaP]                   FLOAT (53)    NULL,
    [ResultatPoluchen]             INT           NULL,
    [DataVzyatiyaBiomateriala]     DATETIME      NULL,
    [Albumin]                      FLOAT (53)    NULL,
    [Transferrin]                  FLOAT (53)    NULL,
    [Glyukoza]                     FLOAT (53)    NULL,
    [AlAT]                         FLOAT (53)    NULL,
    [AcAT]                         FLOAT (53)    NULL,
    [Ferritin]                     FLOAT (53)    NULL,
    [Holesterol]                   FLOAT (53)    NULL,
    [Paratgormon]                  FLOAT (53)    NULL,
    [trigliceridi]                 FLOAT (53)    NULL,
    [HolesterolLPVP]               FLOAT (53)    NULL,
    [HolesterolLPNP]               FLOAT (53)    NULL,
    [ProceNtnasisheniaTransferina] NVARCHAR (50) NULL,
    CONSTRAINT [LaboratoryTestsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LaboratoryTestsToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

