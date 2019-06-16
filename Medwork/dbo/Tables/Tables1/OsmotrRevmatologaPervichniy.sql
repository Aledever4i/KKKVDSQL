﻿CREATE TABLE [dbo].[OsmotrRevmatologaPervichniy] (
    [ID]                        INT           NOT NULL,
    [PatID]                     INT           NULL,
    [Data]                      DATETIME      NULL,
    [Vrach]                     INT           NULL,
    [Zhalobi]                   NTEXT         NULL,
    [Anamnez]                   NTEXT         NULL,
    [Kozha]                     NVARCHAR (50) NULL,
    [Kozha2]                    NVARCHAR (50) NULL,
    [Kozha1]                    NVARCHAR (50) NULL,
    [Kozha3]                    NVARCHAR (50) NULL,
    [LU]                        NVARCHAR (50) NULL,
    [LU1]                       NVARCHAR (50) NULL,
    [LU2]                       NVARCHAR (50) NULL,
    [Sustavi]                   NVARCHAR (50) NULL,
    [Sustavi1]                  NVARCHAR (50) NULL,
    [KonfiguratsiyaSustavov]    NVARCHAR (50) NULL,
    [Sustavi2]                  NVARCHAR (50) NULL,
    [Sustavi3]                  NVARCHAR (50) NULL,
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
    [Tsvet]                     NVARCHAR (50) NULL,
    [Sustavy]                   NVARCHAR (50) NULL,
    [Configuration]             NVARCHAR (50) NULL,
    [SustOtechnost]             NVARCHAR (50) NULL,
    [NarushSustFunction]        NVARCHAR (50) NULL,
    [KoznnyePokrovy]            NVARCHAR (50) NULL,
    [okraska]                   NVARCHAR (50) NULL,
    [Vlaznost]                  NVARCHAR (50) NULL,
    [Otechnost]                 NVARCHAR (50) NULL,
    [LimfatichUzly]             NVARCHAR (50) NULL,
    [Mindaliny]                 NVARCHAR (50) NULL,
    [BreatheCount]              INT           NULL,
    [Legkie]                    NVARCHAR (50) NULL,
    [Breathe]                   NVARCHAR (50) NULL,
    [NadKrupnSosudami]          NVARCHAR (50) NULL,
    [NadKrupSosud1]             NVARCHAR (50) NULL,
    [Pulse]                     INT           NULL,
    [Pulse1]                    INT           NULL,
    [HeartLimits]               NVARCHAR (50) NULL,
    [VerhushTolchock]           NVARCHAR (50) NULL,
    [Tones]                     NVARCHAR (50) NULL,
    [Accent]                    NVARCHAR (50) NULL,
    [TonNa]                     NVARCHAR (50) NULL,
    [Noises]                    NVARCHAR (50) NULL,
    [AdSit]                     NVARCHAR (50) NULL,
    [AdSit1]                    NVARCHAR (50) NULL,
    [AdSit2]                    NVARCHAR (50) NULL,
    [AdSit3]                    NVARCHAR (50) NULL,
    [VistupIzPodReber]          INT           NULL,
    [Boleznennost]              NVARCHAR (50) NULL,
    [SindromPasternatskogo]     NVARCHAR (50) NULL,
    [MocheIspuskaniye]          NVARCHAR (50) NULL,
    [Dizgnoz]                   INT           NULL,
    [GroupDNabl]                NVARCHAR (50) NULL,
    [BLMomer]                   INT           NULL,
    [EditBox1]                  NVARCHAR (50) NULL,
    [PovtornayaYavka]           DATETIME      NULL,
    CONSTRAINT [OsmotrRevmatologaPervichniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrRevmatologaPervichniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
