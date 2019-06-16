﻿CREATE TABLE [dbo].[PovtorniyPriMNefrologa] (
    [ID]                                 INT           NOT NULL,
    [PatID]                              INT           NULL,
    [Data]                               DATETIME      NULL,
    [Vrach]                              INT           NULL,
    [PredvaritelniyDiagnoz]              NTEXT         NULL,
    [ObektivniyStatus]                   NTEXT         NULL,
    [ObsheeSostoyanie]                   INT           NULL,
    [Teloslozhenie]                      INT           NULL,
    [Ves]                                INT           NULL,
    [TemperaturaTela]                    FLOAT (53)    NULL,
    [Kozha1]                             INT           NULL,
    [PigmentatsiyaIDepigmentatsiya]      NVARCHAR (35) NULL,
    [Krovoizliyaniya]                    NVARCHAR (35) NULL,
    [Rubtsi]                             NVARCHAR (35) NULL,
    [FormaIHarakterVisipaniy]            NVARCHAR (35) NULL,
    [SosudistieIzmeneniya]               NVARCHAR (35) NULL,
    [TroficheskieIzmeneniya]             NVARCHAR (35) NULL,
    [Nogti4]                             INT           NULL,
    [Nogti11]                            INT           NULL,
    [Nogti21]                            INT           NULL,
    [Nogti31]                            INT           NULL,
    [LimfaticheskieUzli1]                NTEXT         NULL,
    [Mishtsi1]                           INT           NULL,
    [MishciBoleznennost1]                NVARCHAR (1)  NULL,
    [Kosti1]                             NTEXT         NULL,
    [KostiBoleznennost1]                 NVARCHAR (1)  NULL,
    [Sustavi1]                           NTEXT         NULL,
    [SustaviBoleznnenost1]               NVARCHAR (1)  NULL,
    [SustaviDeformacii1]                 NVARCHAR (1)  NULL,
    [sustaviDefiguracii1]                NVARCHAR (1)  NULL,
    [Pochki1]                            NTEXT         NULL,
    [SMPasternatskogo1]                  INT           NULL,
    [Mocheispuskanie1]                   INT           NULL,
    [PoseshenieNaDomu1]                  NVARCHAR (1)  NULL,
    [KompleksniyOsmotr1]                 NVARCHAR (1)  NULL,
    [NeobhodimaFlyuorografiya1]          NVARCHAR (1)  NULL,
    [NuzhdaetsyaVStatsionarnomLechenii1] NVARCHAR (1)  NULL,
    CONSTRAINT [PovtorniyPriMNefrologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMNefrologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

