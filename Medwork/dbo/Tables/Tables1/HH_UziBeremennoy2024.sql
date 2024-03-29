﻿CREATE TABLE [dbo].[HH_UziBeremennoy2024] (
    [ID]                  INT           NOT NULL,
    [PatID]               INT           NULL,
    [Zakluchenie]         NTEXT         NULL,
    [Vrach]               NVARCHAR (50) NULL,
    [Data]                DATETIME      NULL,
    [DateMenstr]          DATETIME      NULL,
    [SrokBeremenosti]     INT           NULL,
    [KolPlodov]           NVARCHAR (1)  NULL,
    [Plodi]               NVARCHAR (10) NULL,
    [BipRazmerGolovi]     FLOAT (53)    NULL,
    [OkrGolovi]           FLOAT (53)    NULL,
    [OkrZhivota]          FLOAT (53)    NULL,
    [LobnoZatRazmer]      FLOAT (53)    NULL,
    [DlinBedrKostiL]      FLOAT (53)    NULL,
    [DlinBedrKostiP]      FLOAT (53)    NULL,
    [DlinKostGolenP]      FLOAT (53)    NULL,
    [DlinPlechKostP]      FLOAT (53)    NULL,
    [DlinKostPredplechP]  FLOAT (53)    NULL,
    [DlinKostPredplechL]  FLOAT (53)    NULL,
    [DlinPlechKostL]      FLOAT (53)    NULL,
    [DlinKostGolenL]      FLOAT (53)    NULL,
    [RazmSootv]           NVARCHAR (70) NULL,
    [RazmPloda]           INT           NULL,
    [RazmSootvText]       NVARCHAR (70) NULL,
    [BokSheludochkiMozga] NVARCHAR (20) NULL,
    [Mozshechok]          NVARCHAR (20) NULL,
    [PredVesPloda]        INT           NULL,
    [BolshayChisterna]    NVARCHAR (20) NULL,
    [Profil]              NVARCHAR (20) NULL,
    [NosogybnTreygol]     NVARCHAR (20) NULL,
    [Glaznici]            NVARCHAR (20) NULL,
    [Legkie]              NVARCHAR (20) NULL,
    [Pozvonocnik]         NVARCHAR (20) NULL,
    [SrezSerdca]          NVARCHAR (20) NULL,
    [Srez3]               NVARCHAR (20) NULL,
    [Kishecnik]           NVARCHAR (20) NULL,
    [Shelydok]            NVARCHAR (20) NULL,
    [Pochki]              NVARCHAR (20) NULL,
    [MocevoiPyziri]       NVARCHAR (20) NULL,
    [MestoPricrepl]       NVARCHAR (20) NULL,
    [PeredZadSten]        NVARCHAR (10) NULL,
    [PlacentaRaspol]      NVARCHAR (10) NULL,
    [NaDne]               FLOAT (53)    NULL,
    [OblVnutrZeva]        NVARCHAR (20) NULL,
    [TolshinaPlacenti]    NVARCHAR (20) NULL,
    [TolshinaDo]          FLOAT (53)    NULL,
    [StryktyraPlacenti]   NVARCHAR (50) NULL,
    [StepenZrelosti]      NVARCHAR (50) NULL,
    [Sootvetstvie]        NVARCHAR (50) NULL,
    [Kolvod]              NVARCHAR (50) NULL,
    [IndexAmniot]         FLOAT (53)    NULL,
    [PypovinaIm]          NVARCHAR (50) NULL,
    [TolshinaDoText]      NVARCHAR (10) NULL,
    [VrozhdPoroki]        NVARCHAR (80) NULL,
    [stenkiMatki]         NVARCHAR (50) NULL,
    [OblostPredatkov]     NVARCHAR (50) NULL,
    [Vizyalizacia]        NVARCHAR (50) NULL,
    [DopData]             NVARCHAR (50) NULL,
    CONSTRAINT [HH_UziBeremennoy2024PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [HH_UziBeremennoy2024ToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

