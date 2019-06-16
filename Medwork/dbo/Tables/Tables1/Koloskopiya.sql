﻿CREATE TABLE [dbo].[Koloskopiya] (
    [ID]                                          INT           NOT NULL,
    [PatID]                                       INT           NULL,
    [Data]                                        DATETIME      NULL,
    [KlinicheskiyDiagnoz]                         NTEXT         NULL,
    [Apparat]                                     NVARCHAR (50) NULL,
    [BauginievaZaslonka]                          NVARCHAR (50) NULL,
    [Osmotreni]                                   NVARCHAR (1)  NULL,
    [Osmotreni1]                                  NVARCHAR (1)  NULL,
    [Osmotreni3]                                  NVARCHAR (1)  NULL,
    [Osmotreni4]                                  NVARCHAR (1)  NULL,
    [Osmotreni5]                                  NVARCHAR (1)  NULL,
    [Osmotreni6]                                  NVARCHAR (1)  NULL,
    [Osmotreni2]                                  NVARCHAR (1)  NULL,
    [Soderzhimoe]                                 NVARCHAR (1)  NULL,
    [Soderzhimoe1]                                NVARCHAR (1)  NULL,
    [Soderzhimoe2]                                NVARCHAR (1)  NULL,
    [Soderzhimoe3]                                NVARCHAR (1)  NULL,
    [Prosvet]                                     NVARCHAR (50) NULL,
    [Stenka]                                      NVARCHAR (50) NULL,
    [Tonus]                                       NVARCHAR (50) NULL,
    [SlizistayaObolochka]                         NVARCHAR (50) NULL,
    [Patologiya]                                  NTEXT         NULL,
    [DopolnitelnieDiagnosticheskieManipulyatsii]  NVARCHAR (1)  NULL,
    [DopolnitelnieDiagnosticheskieManipulyatsii1] NVARCHAR (1)  NULL,
    [Zaklyuchenie]                                NTEXT         NULL,
    CONSTRAINT [KoloskopiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KoloskopiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

