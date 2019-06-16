﻿CREATE TABLE [dbo].[ProfosmotrOtorinolaringolog] (
    [ID]                   INT            NOT NULL,
    [PatID]                INT            NULL,
    [Data]                 DATETIME       NULL,
    [Vrach]                INT            NULL,
    [Zaklyuchenie]         NVARCHAR (100) NULL,
    [Kommentrariy]         NTEXT          NULL,
    [Zhalobi1]             NTEXT          NULL,
    [AnamnezZabolevaniya1] NTEXT          NULL,
    [NosovoeDixanie]       NVARCHAR (50)  NULL,
    [BezIzmeneniy]         NVARCHAR (1)   NULL,
    [PolostNosaSoderzhit]  NVARCHAR (50)  NULL,
    [Slizistay]            NVARCHAR (50)  NULL,
    [NosovieRakovini1]     NVARCHAR (50)  NULL,
    [NosovayPeregorodka]   NVARCHAR (50)  NULL,
    [NosovayPeregorodka2]  NVARCHAR (50)  NULL,
    [Nosoglotka]           NVARCHAR (50)  NULL,
    [Nosoglodka2]          NVARCHAR (50)  NULL,
    [Glotka]               NVARCHAR (50)  NULL,
    [Glotka2]              NVARCHAR (50)  NULL,
    [Mindalini3]           NVARCHAR (50)  NULL,
    [Mindalini2]           NVARCHAR (50)  NULL,
    [LimfaticheskieYzli]   NVARCHAR (50)  NULL,
    [LimfaticheskieYzli2]  NVARCHAR (50)  NULL,
    [GolosovayFunkciy]     NVARCHAR (50)  NULL,
    [Gortan]               NVARCHAR (1)   NULL,
    [Gortan2]              NVARCHAR (50)  NULL,
    [SluxovoiProxod]       NVARCHAR (50)  NULL,
    [SluxovoiProxod2]      NVARCHAR (50)  NULL,
    [BarabannayPereponka]  NVARCHAR (50)  NULL,
    [BarabannayPereponka2] NVARCHAR (50)  NULL,
    [SluxD]                FLOAT (53)     NULL,
    [SluxS]                FLOAT (53)     NULL,
    [SluxRRD]              FLOAT (53)     NULL,
    [SluxRRS]              FLOAT (53)     NULL,
    [Memo2]                NTEXT          NULL,
    [GruppaD]              NVARCHAR (2)   NULL,
    [Vievleno]             NVARCHAR (10)  NULL,
    [Mindalini]            NVARCHAR (50)  NULL,
    [DiagnozPoMkb10]       NVARCHAR (80)  NULL,
    [KodPoMkb10]           NVARCHAR (10)  NULL,
    [Recommendation]       NTEXT          NULL,
    CONSTRAINT [ProfosmotrOtorinolaringologPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProfosmotrOtorinolaringologToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

