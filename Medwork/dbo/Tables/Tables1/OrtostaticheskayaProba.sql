﻿CREATE TABLE [dbo].[OrtostaticheskayaProba] (
    [ID]                                      INT           NOT NULL,
    [PatID]                                   INT           NULL,
    [MasterID]                                INT           NULL,
    [FIOObsleduemogo]                         NVARCHAR (80) NULL,
    [Data]                                    DATETIME      NULL,
    [Metodika]                                NTEXT         NULL,
    [ObemnoePulsovoeKrovenapolnenie]          NTEXT         NULL,
    [TonusMagistralnihArteriy]                NTEXT         NULL,
    [TonusKrupnihArteriy]                     NTEXT         NULL,
    [TonusSrednihIMelkihArteriy]              NTEXT         NULL,
    [PerifericheskoeSosudistoeSoprotivlenie]  NTEXT         NULL,
    [VoVsehBaseynah]                          NTEXT         NULL,
    [ObemnoePulsovoeKrovenapolnenie1]         NTEXT         NULL,
    [TonusMagistralnihArteriy1]               NTEXT         NULL,
    [TonusKrupnihArteriy1]                    NTEXT         NULL,
    [TonusSrednihIMelkihArteriy1]             NTEXT         NULL,
    [PerifericheskoeSosudistoeSoprotivlenie1] NTEXT         NULL,
    [VoVsehBaseynah1]                         NTEXT         NULL,
    [DannieEkg]                               NTEXT         NULL,
    [PerenosimostOrtostaticheskoyProbi]       NVARCHAR (50) NULL,
    [VoVremyaAntiortostaticheskoyProbi]       NTEXT         NULL,
    [PoDannimEkg]                             NTEXT         NULL,
    [PerenosimostAntiortostaticheskoyProbi]   NVARCHAR (50) NULL,
    [PerenosimostOrtostaticheskoyProbi1]      NVARCHAR (50) NULL,
    CONSTRAINT [OrtostaticheskayaProbaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OrtostaticheskayaProbaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

