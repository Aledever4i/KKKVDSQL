﻿CREATE TABLE [dbo].[KonsultatsiyaNevrologa] (
    [ID]                                               INT           NOT NULL,
    [PatID]                                            INT           NULL,
    [Memo1]                                            NTEXT         NULL,
    [Memo2]                                            NTEXT         NULL,
    [Memo3]                                            NTEXT         NULL,
    [Memo4]                                            NTEXT         NULL,
    [Memo5]                                            NTEXT         NULL,
    [Combo1]                                           NVARCHAR (50) NULL,
    [EditBox1]                                         NVARCHAR (50) NULL,
    [EditBox2]                                         NVARCHAR (50) NULL,
    [Memo6]                                            NTEXT         NULL,
    [Memo7]                                            NTEXT         NULL,
    [Memo8]                                            NTEXT         NULL,
    [Memo9]                                            NTEXT         NULL,
    [Memo10]                                           NTEXT         NULL,
    [Memo11]                                           NTEXT         NULL,
    [Memo12]                                           NTEXT         NULL,
    [Memo13]                                           NTEXT         NULL,
    [Memo14]                                           NTEXT         NULL,
    [Zhalobi]                                          NTEXT         NULL,
    [AnamnezZabolevaniya]                              NTEXT         NULL,
    [PerenesennieZabolevaniyaOtnosyashiesyaKOsnovnomu] NTEXT         NULL,
    [Nasledstvennost]                                  NTEXT         NULL,
    [AllergologicheskiyAnaliz]                         NTEXT         NULL,
    [Sostoyanie]                                       NVARCHAR (50) NULL,
    [Ad]                                               NVARCHAR (50) NULL,
    [PS]                                               NVARCHAR (50) NULL,
    [Kozha]                                            NTEXT         NULL,
    [EmotsionalnoKognitivnayaSfera]                    NTEXT         NULL,
    [MeningealniySindrom]                              NTEXT         NULL,
    [Chmn]                                             NTEXT         NULL,
    [DvigatelnayaSfera]                                NTEXT         NULL,
    [ChuvstvitelnieNarusheniya]                        NTEXT         NULL,
    [KoordinatnieProbi]                                NTEXT         NULL,
    [NarusheniyaFunktsiyTazovihOrganov]                NTEXT         NULL,
    [VertebralniySindrom]                              NTEXT         NULL,
    [KoreshkoviySindrom]                               NTEXT         NULL,
    [Diagnoz]                                          NTEXT         NULL,
    [Rekomendatsii]                                    NTEXT         NULL,
    [Data]                                             DATETIME      NULL,
    CONSTRAINT [KonsultatsiyaNevrologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KonsultatsiyaNevrologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
