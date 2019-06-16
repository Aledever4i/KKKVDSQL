﻿CREATE TABLE [dbo].[OsmotrKardiologaPovtorniy] (
    [ID]                        INT           NOT NULL,
    [PatID]                     INT           NULL,
    [Zhalobi]                   NTEXT         NULL,
    [Anamnez]                   NTEXT         NULL,
    [Kozha2]                    NVARCHAR (50) NULL,
    [Kozha1]                    NVARCHAR (50) NULL,
    [LU2]                       NVARCHAR (50) NULL,
    [Sustavi]                   NVARCHAR (50) NULL,
    [Sustavi1]                  NVARCHAR (50) NULL,
    [KonfiguratsiyaSustavov]    NVARCHAR (50) NULL,
    [Sustavi2]                  NVARCHAR (50) NULL,
    [Patologii]                 NVARCHAR (50) NULL,
    [Patologii1]                NVARCHAR (50) NULL,
    [Zev]                       NVARCHAR (50) NULL,
    [Mindalini]                 NVARCHAR (50) NULL,
    [Mindalini1]                NVARCHAR (50) NULL,
    [Dihanie]                   NVARCHAR (50) NULL,
    [Hripi]                     NVARCHAR (50) NULL,
    [Hripi1]                    NVARCHAR (50) NULL,
    [GranitsiSerdtsa]           NVARCHAR (50) NULL,
    [Puls]                      INT           NULL,
    [Napolneniya]               NVARCHAR (50) NULL,
    [Puls1]                     NVARCHAR (50) NULL,
    [Puls2]                     NVARCHAR (50) NULL,
    [VerhushechniyTolchok]      NVARCHAR (50) NULL,
    [Toni]                      NVARCHAR (50) NULL,
    [AktsentTonaNa]             NVARCHAR (50) NULL,
    [Shumi]                     NVARCHAR (50) NULL,
    [NadKrupnimiSosudami]       NVARCHAR (50) NULL,
    [Sidya]                     INT           NULL,
    [LZha]                      INT           NULL,
    [LevayaRuka]                INT           NULL,
    [Pravaya]                   INT           NULL,
    [Pechen]                    NVARCHAR (50) NULL,
    [VistupaetIzPodreberyaNa]   INT           NULL,
    [Uplotnena]                 NVARCHAR (50) NULL,
    [Selezenka]                 NVARCHAR (50) NULL,
    [Pochki]                    NVARCHAR (50) NULL,
    [Pochki1]                   NVARCHAR (50) NULL,
    [SMPasternatskogo]          NVARCHAR (50) NULL,
    [Mocheispuskanie]           NVARCHAR (50) NULL,
    [Stul]                      NVARCHAR (50) NULL,
    [Diagnoz]                   NVARCHAR (50) NULL,
    [GruppaDNablyudeniyaD1D2D3] NVARCHAR (50) NULL,
    [BLNomer]                   INT           NULL,
    [Srok]                      DATETIME      NULL,
    [AktivnoePoseshenie]        NVARCHAR (50) NULL,
    [YavkaVPolikliniku]         DATETIME      NULL,
    [Data]                      DATETIME      NULL,
    [Vrach]                     INT           NULL,
    [Okras]                     NVARCHAR (50) NULL,
    [Vlajnost]                  NVARCHAR (50) NULL,
    [EditBox1]                  NVARCHAR (50) NULL,
    [EditBox2]                  INT           NULL,
    [LZha1]                     INT           NULL,
    [LevayaRuka1]               INT           NULL,
    [Pravaya1]                  INT           NULL,
    CONSTRAINT [OsmotrKardiologaPovtorniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrKardiologaPovtorniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

