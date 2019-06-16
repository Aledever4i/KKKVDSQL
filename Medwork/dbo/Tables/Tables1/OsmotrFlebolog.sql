﻿CREATE TABLE [dbo].[OsmotrFlebolog] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [Jalobi]                   NTEXT         NULL,
    [AnamnezZabolevania]       NTEXT         NULL,
    [AllergologicheskiAnamnez] NTEXT         NULL,
    [ObshiAnamnez]             NTEXT         NULL,
    [NadLodPravo]              FLOAT (53)    NULL,
    [NadLodLevo]               FLOAT (53)    NULL,
    [SredTretGolPravo]         FLOAT (53)    NULL,
    [SredTretGolLevo]          FLOAT (53)    NULL,
    [SredTretBedPravo]         FLOAT (53)    NULL,
    [SredTretBed]              FLOAT (53)    NULL,
    [PulsArtNaStopah]          NTEXT         NULL,
    [c1]                       NVARCHAR (1)  NULL,
    [c2]                       NVARCHAR (1)  NULL,
    [c3]                       NVARCHAR (1)  NULL,
    [c4]                       NVARCHAR (1)  NULL,
    [c5]                       NVARCHAR (1)  NULL,
    [c6]                       NVARCHAR (1)  NULL,
    [c7]                       NVARCHAR (1)  NULL,
    [c8]                       NVARCHAR (1)  NULL,
    [c9]                       NVARCHAR (1)  NULL,
    [c10]                      NVARCHAR (1)  NULL,
    [c11]                      NVARCHAR (1)  NULL,
    [c12]                      NVARCHAR (1)  NULL,
    [c13]                      NVARCHAR (1)  NULL,
    [c14]                      NVARCHAR (1)  NULL,
    [c15]                      NVARCHAR (1)  NULL,
    [c16]                      NVARCHAR (1)  NULL,
    [c17]                      NVARCHAR (1)  NULL,
    [c18]                      NVARCHAR (1)  NULL,
    [c19]                      NVARCHAR (1)  NULL,
    [c20]                      NVARCHAR (1)  NULL,
    [c21]                      NVARCHAR (1)  NULL,
    [c22]                      NVARCHAR (1)  NULL,
    [c23]                      NVARCHAR (1)  NULL,
    [c24]                      NVARCHAR (1)  NULL,
    [c25]                      NVARCHAR (1)  NULL,
    [c26]                      NVARCHAR (1)  NULL,
    [c27]                      NVARCHAR (1)  NULL,
    [c28]                      NVARCHAR (1)  NULL,
    [c29]                      NVARCHAR (1)  NULL,
    [c30]                      NVARCHAR (1)  NULL,
    [c31]                      NVARCHAR (1)  NULL,
    [c32]                      NVARCHAR (1)  NULL,
    [c33]                      NVARCHAR (1)  NULL,
    [c34]                      NVARCHAR (1)  NULL,
    [c35]                      NVARCHAR (1)  NULL,
    [c36]                      NVARCHAR (1)  NULL,
    [c37]                      NVARCHAR (1)  NULL,
    [c38]                      NVARCHAR (1)  NULL,
    [c39]                      NVARCHAR (1)  NULL,
    [c40]                      NVARCHAR (1)  NULL,
    [c41]                      NVARCHAR (1)  NULL,
    [c42]                      NVARCHAR (1)  NULL,
    [c43]                      NVARCHAR (1)  NULL,
    [c44]                      NVARCHAR (1)  NULL,
    [c45]                      NVARCHAR (1)  NULL,
    [c46]                      NVARCHAR (1)  NULL,
    [c47]                      NVARCHAR (1)  NULL,
    [c48]                      NVARCHAR (1)  NULL,
    [c49]                      NVARCHAR (1)  NULL,
    [c50]                      NVARCHAR (1)  NULL,
    [c51]                      NVARCHAR (1)  NULL,
    [c52]                      NVARCHAR (1)  NULL,
    [c53]                      NVARCHAR (1)  NULL,
    [c54]                      NVARCHAR (1)  NULL,
    [c55]                      NVARCHAR (1)  NULL,
    [c56]                      NVARCHAR (1)  NULL,
    [c57]                      NVARCHAR (1)  NULL,
    [c58]                      NVARCHAR (1)  NULL,
    [c59]                      NVARCHAR (1)  NULL,
    [c60]                      NVARCHAR (1)  NULL,
    [c61]                      NVARCHAR (1)  NULL,
    [c62]                      NVARCHAR (1)  NULL,
    [c63]                      NVARCHAR (1)  NULL,
    [c64]                      NVARCHAR (1)  NULL,
    [c65]                      NVARCHAR (1)  NULL,
    [c66]                      NVARCHAR (1)  NULL,
    [c67]                      NVARCHAR (1)  NULL,
    [c68]                      NVARCHAR (1)  NULL,
    [c69]                      NVARCHAR (1)  NULL,
    [c70]                      NVARCHAR (1)  NULL,
    [c71]                      NVARCHAR (1)  NULL,
    [c72]                      NVARCHAR (1)  NULL,
    [c73]                      NVARCHAR (1)  NULL,
    [c74]                      NVARCHAR (1)  NULL,
    [c75]                      NVARCHAR (1)  NULL,
    [c76]                      NVARCHAR (1)  NULL,
    [c77]                      NVARCHAR (1)  NULL,
    [c78]                      NVARCHAR (1)  NULL,
    [c79]                      NVARCHAR (1)  NULL,
    [c80]                      NVARCHAR (1)  NULL,
    [c81]                      NVARCHAR (1)  NULL,
    [c82]                      NVARCHAR (1)  NULL,
    [c83]                      NVARCHAR (1)  NULL,
    [c84]                      NVARCHAR (1)  NULL,
    [c85]                      NVARCHAR (1)  NULL,
    [c86]                      NVARCHAR (1)  NULL,
    [c87]                      NVARCHAR (1)  NULL,
    [c88]                      NVARCHAR (1)  NULL,
    [c89]                      NVARCHAR (1)  NULL,
    [c90]                      NVARCHAR (1)  NULL,
    [c91]                      NVARCHAR (1)  NULL,
    [c92]                      NVARCHAR (1)  NULL,
    [c93]                      NVARCHAR (1)  NULL,
    [c94]                      NVARCHAR (1)  NULL,
    [c95]                      NVARCHAR (1)  NULL,
    [c96]                      NVARCHAR (1)  NULL,
    [c97]                      NVARCHAR (1)  NULL,
    [c98]                      NVARCHAR (1)  NULL,
    [c99]                      NVARCHAR (1)  NULL,
    [c100]                     NVARCHAR (1)  NULL,
    [c101]                     NVARCHAR (1)  NULL,
    [c102]                     NVARCHAR (1)  NULL,
    [c103]                     NVARCHAR (1)  NULL,
    [c104]                     NVARCHAR (1)  NULL,
    [c105]                     NVARCHAR (1)  NULL,
    [c106]                     NVARCHAR (1)  NULL,
    [c107]                     NVARCHAR (1)  NULL,
    [c108]                     NVARCHAR (1)  NULL,
    [PlanLechenia]             NTEXT         NULL,
    [Vrach]                    INT           NULL,
    [obshsost]                 NVARCHAR (50) NULL,
    [ObemDvizheniyVSustavah]   NVARCHAR (50) NULL,
    [DihanieCherezNos]         NVARCHAR (50) NULL,
    [Chdd]                     INT           NULL,
    [Soznanie]                 NVARCHAR (50) NULL,
    [AdNaLevoyRukeSistor]      INT           NULL,
    [AdNaLevoyRukeDia]         INT           NULL,
    [Puls]                     INT           NULL,
    [Styl]                     NVARCHAR (50) NULL,
    [Yazik1]                   NVARCHAR (50) NULL,
    [Yazik3]                   NVARCHAR (50) NULL,
    [Jivot]                    NVARCHAR (50) NULL,
    [Vzdut]                    NVARCHAR (1)  NULL,
    [Zhivot]                   NVARCHAR (50) NULL,
    [PriPalpatsiiBoleznennost] NVARCHAR (50) NULL,
    [Pechen]                   NVARCHAR (50) NULL,
    [VistupaetIzPodreberyaNa]  INT           NULL,
    [Kray]                     NVARCHAR (50) NULL,
    [Zatrudnennoe]             NVARCHAR (50) NULL,
    [boleznennoe]              NVARCHAR (50) NULL,
    [Pochki]                   NVARCHAR (50) NULL,
    [kozhnyepokrovy1]          NVARCHAR (50) NULL,
    [kozhnyepokrovymemo1]      NTEXT         NULL,
    [strii1]                   NVARCHAR (50) NULL,
    [striimemo1]               NTEXT         NULL,
    [turgor1]                  NVARCHAR (50) NULL,
    [vlaznost11]               NVARCHAR (50) NULL,
    [okraska11]                NVARCHAR (50) NULL,
    [Pzhkletchatka1]           NVARCHAR (50) NULL,
    [Vipolneno]                NTEXT         NULL,
    [Rekomendovanno]           NTEXT         NULL,
    [Image1]                   IMAGE         NULL,
    CONSTRAINT [OsmotrFlebologPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrFlebologToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

