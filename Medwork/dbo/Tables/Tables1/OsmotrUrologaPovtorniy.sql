﻿CREATE TABLE [dbo].[OsmotrUrologaPovtorniy] (
    [ID]                                    INT           NOT NULL,
    [PatID]                                 INT           NULL,
    [Zhalobi]                               NTEXT         NULL,
    [BoliVPoyasnichnoyOblasti]              NVARCHAR (1)  NULL,
    [OthozhdenieKonkrementovSMochoy]        NVARCHAR (1)  NULL,
    [Slabost]                               NVARCHAR (1)  NULL,
    [Potlivost]                             NVARCHAR (1)  NULL,
    [SuhostVoRtu]                           NVARCHAR (1)  NULL,
    [Oznob]                                 NVARCHAR (1)  NULL,
    [BoliVPoyasnichnoyOblasti1]             NVARCHAR (50) NULL,
    [IzmenenieTemperaturiTelaDo]            FLOAT (53)    NULL,
    [Uchashennoe]                           NVARCHAR (1)  NULL,
    [Boleznennoe]                           NVARCHAR (1)  NULL,
    [IzmenenieTsveta]                       NVARCHAR (1)  NULL,
    [IzmenenieZapahaMochi]                  NVARCHAR (1)  NULL,
    [OsadokVMoche]                          NVARCHAR (1)  NULL,
    [Konkrementi]                           NVARCHAR (1)  NULL,
    [VideleniyaIzMocheispuskatelnogoKanala] NVARCHAR (50) NULL,
    [Mocheispuskanie]                       NVARCHAR (50) NULL,
    [Otek]                                  NVARCHAR (50) NULL,
    [PoyasnichnayaOblast]                   NVARCHAR (50) NULL,
    [PalpatsiyaPochek]                      NVARCHAR (50) NULL,
    [Pochki]                                NVARCHAR (50) NULL,
    [SformirovaniPravilno]                  NVARCHAR (1)  NULL,
    [Golovka]                               NVARCHAR (50) NULL,
    [ObrazovaniyVOblastiKrayneyPloti]       NVARCHAR (50) NULL,
    [Kriptorhizm]                           NVARCHAR (1)  NULL,
    [Kriptorhizm1]                          NVARCHAR (50) NULL,
    [Gipoplaziya]                           NVARCHAR (1)  NULL,
    [Gipoplaziya1]                          NVARCHAR (50) NULL,
    [PridatkiPriPalpatsii]                  NVARCHAR (50) NULL,
    [PridatkiPriPalpatsii1]                 NVARCHAR (50) NULL,
    [PridatkiPriPalpatsii2]                 NVARCHAR (50) NULL,
    [SKozheyMoshonki]                       NVARCHAR (50) NULL,
    [SvishiVOblastiMoshonki]                NVARCHAR (50) NULL,
    [VeniSemennogoKanatika1]                NVARCHAR (50) NULL,
    [VeniSemennogoKanatika]                 NVARCHAR (50) NULL,
    [OblastAnusaIzmenena]                   NVARCHAR (1)  NULL,
    [GemorroidalnieUzli]                    NVARCHAR (1)  NULL,
    [TreshiniPryamoyKishki]                 NVARCHAR (1)  NULL,
    [AmpulaPryamoyKishkiSvobodnaya]         NVARCHAR (1)  NULL,
    [ObrazovaniyVPolostiPryamoyKishki]      NVARCHAR (50) NULL,
    [DictCombo1]                            NVARCHAR (50) NULL,
    [Podvizhnaya]                           NVARCHAR (1)  NULL,
    [NeSmeshaetsya]                         NVARCHAR (1)  NULL,
    [OtverstieMocheispuskatelnogoKanala]    NVARCHAR (50) NULL,
    [UretrotsistoskopVvedenSvobodno]        NVARCHAR (1)  NULL,
    [SemennoyBugorok]                       NVARCHAR (50) NULL,
    [SlizistayaUretri]                      NVARCHAR (50) NULL,
    [KodPoMkb10]                            NVARCHAR (10) NULL,
    [DiagnozPoMkb10]                        NVARCHAR (80) NULL,
    [Vrach]                                 INT           NULL,
    [Data]                                  DATETIME      NULL,
    CONSTRAINT [OsmotrUrologaPovtorniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrUrologaPovtorniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

