﻿CREATE TABLE [dbo].[SanKurKartaF072] (
    [ID]                          INT            NOT NULL,
    [PatID]                       INT            NULL,
    [Nomer]                       FLOAT (53)     NULL,
    [DocDate]                     DATETIME       NULL,
    [Otchestvo]                   NVARCHAR (50)  NULL,
    [familia]                     NVARCHAR (50)  NULL,
    [Imya]                        NVARCHAR (50)  NULL,
    [pol]                         NVARCHAR (50)  NULL,
    [adres]                       NTEXT          NULL,
    [rabota1]                     NTEXT          NULL,
    [Diagnoznapravivshego]        NVARCHAR (50)  NULL,
    [Diagnozklinicheskiy]         NVARCHAR (50)  NULL,
    [Diagnozpripostuplenii]       NVARCHAR (50)  NULL,
    [LechashiyVrachOuter]         NVARCHAR (50)  NULL,
    [BirthDate]                   NVARCHAR (20)  NULL,
    [CaseHistoryNum]              NVARCHAR (20)  NULL,
    [OMSNum]                      NVARCHAR (100) NULL,
    [KodLgoty]                    NVARCHAR (100) NULL,
    [SocUslugiDocNum]             NVARCHAR (100) NULL,
    [Snils]                       NVARCHAR (50)  NULL,
    [Escort]                      NVARCHAR (1)   NULL,
    [rabota]                      NVARCHAR (50)  NULL,
    [PrevTreat]                   NTEXT          NULL,
    [PrevTreat1]                  NTEXT          NULL,
    [DiagnozSoputst1]             NVARCHAR (50)  NULL,
    [DiagnozSoputst2]             NVARCHAR (50)  NULL,
    [DiagnozSoputst3]             NVARCHAR (50)  NULL,
    [DateBox1]                    DATETIME       NULL,
    [Diagnozpripostuplenii2]      NVARCHAR (255) NULL,
    [Diagnoznapravivshego2]       NVARCHAR (50)  NULL,
    [Diagnoznapravivshego4]       NVARCHAR (255) NULL,
    [Diagnozpripostuplenii4]      NVARCHAR (255) NULL,
    [DiagnozSoputst7]             NVARCHAR (50)  NULL,
    [DiagnozSoputst8]             NVARCHAR (50)  NULL,
    [DiagnozSoputst9]             NVARCHAR (50)  NULL,
    [DiagnozSoputst3Txt2]         NVARCHAR (255) NULL,
    [DiagnozSoputst2Txt2]         NVARCHAR (255) NULL,
    [DiagnozSoputst1Txt2]         NVARCHAR (255) NULL,
    [Lechenie]                    NVARCHAR (50)  NULL,
    [EditBox1]                    INT            NULL,
    [EditBox2]                    NVARCHAR (50)  NULL,
    [Memo1]                       NTEXT          NULL,
    [nomerput]                    NVARCHAR (50)  NULL,
    [seriaput]                    NVARCHAR (50)  NULL,
    [lechvrach]                   NVARCHAR (50)  NULL,
    [DictCombo1]                  NVARCHAR (50)  NULL,
    [Diagnoznapravivshego1]       NVARCHAR (255) NULL,
    [DiagnozSoputst2Txt]          NVARCHAR (255) NULL,
    [DiagnozSoputst3Txt]          NVARCHAR (255) NULL,
    [DiagnozSoputst1Txt]          NVARCHAR (255) NULL,
    [Ogrn]                        NVARCHAR (50)  NULL,
    [nazvnapravivsheiorganizacii] NVARCHAR (50)  NULL,
    [OGRNNapravivsheiorganiz]     NVARCHAR (50)  NULL,
    CONSTRAINT [PK_SanKurKartaF072] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SanKurKartaF072ToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
