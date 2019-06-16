﻿CREATE TABLE [dbo].[ProtokolOftalmolog] (
    [ID]                                INT            NOT NULL,
    [PatID]                             INT            NULL,
    [Diagnoz1]                          NVARCHAR (50)  NULL,
    [GlaznoeDno1]                       NVARCHAR (50)  NULL,
    [OpticheskieSredi1]                 NVARCHAR (50)  NULL,
    [SlezootvodyashiePuti1]             NVARCHAR (50)  NULL,
    [Veki1]                             NVARCHAR (50)  NULL,
    [GranitsiPoleyZreniyaNaBeliyTsvet3] NVARCHAR (50)  NULL,
    [GranitsiPoleyZreniyaNaBeliyTsvet2] NVARCHAR (50)  NULL,
    [BinokulyarnoeZrenie1]              NVARCHAR (50)  NULL,
    [Tsvetooshushenie1]                 NVARCHAR (50)  NULL,
    [FIO]                               NVARCHAR (100) NULL,
    [Vozrast]                           DATETIME       NULL,
    [Zhalobi]                           NTEXT          NULL,
    [Anamnez]                           NTEXT          NULL,
    [OstrotaZreniya]                    NVARCHAR (100) NULL,
    [Tsvetooshushenie]                  NVARCHAR (100) NULL,
    [OstrotaZreniya2]                   NVARCHAR (100) NULL,
    [BlizhayshayaTochkaYasnogoZreniya]  NVARCHAR (50)  NULL,
    [BlizhayshayaTochkaYasnogoZreniya1] NVARCHAR (50)  NULL,
    [BlizhayshayaTochkaKonvergentsii]   NVARCHAR (50)  NULL,
    [BinokulyarnoeZrenie]               NVARCHAR (100) NULL,
    [TemnovayaAdaptatsiyaVAdm]          NVARCHAR (50)  NULL,
    [GranitsiPoleyZreniyaNaBeliyTsvet1] NVARCHAR (100) NULL,
    [GranitsiPoleyZreniyaNaBeliyTsvet]  NVARCHAR (100) NULL,
    [BlizhayshayaTochkaYasnogoZreniya2] NVARCHAR (50)  NULL,
    [BlizhayshayaTochkaYasnogoZreniya3] NVARCHAR (50)  NULL,
    [Tenziya]                           NVARCHAR (50)  NULL,
    [Veki]                              NVARCHAR (100) NULL,
    [Koyunktivi1]                       NVARCHAR (50)  NULL,
    [Koyunktivi]                        NVARCHAR (100) NULL,
    [SlezootvodyashiePuti]              NVARCHAR (100) NULL,
    [OpticheskieSredi]                  NVARCHAR (100) NULL,
    [OpticheskieSredi2]                 NTEXT          NULL,
    [GlaznoeDno]                        NVARCHAR (100) NULL,
    [GlaznoeDno2]                       NTEXT          NULL,
    [DopolnitelnieIssledovaniya]        NTEXT          NULL,
    [Diagnoz]                           NTEXT          NULL,
    [ZaklyucheniePoSt]                  NVARCHAR (50)  NULL,
    [ZaklyucheniePoSt1]                 NVARCHAR (50)  NULL,
    [ZaklyucheniePoSt2]                 NVARCHAR (50)  NULL,
    [Data]                              DATETIME       NULL,
    [DictCombo1]                        NVARCHAR (50)  NULL,
    CONSTRAINT [ProtokolOftalmologPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProtokolOftalmologToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
