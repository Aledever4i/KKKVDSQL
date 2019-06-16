﻿CREATE TABLE [dbo].[DopolnitelniyOsmotrRefleksoterapevta] (
    [ID]                                   INT           NOT NULL,
    [PatID]                                INT           NULL,
    [RefleksiSVerhnihKonechnostey]         NVARCHAR (50) NULL,
    [RefleksiSNizhnihKonechnostey]         NVARCHAR (50) NULL,
    [Ataksiya]                             NVARCHAR (1)  NULL,
    [PromahivaetsyaPriPaltsenosovoyProbe]  NVARCHAR (1)  NULL,
    [Chuvstvitelnost]                      NVARCHAR (50) NULL,
    [Apraksiya]                            NVARCHAR (1)  NULL,
    [Asteriognoz]                          NVARCHAR (1)  NULL,
    [Apraksiya1]                           NVARCHAR (50) NULL,
    [Asteriognoz1]                         NVARCHAR (50) NULL,
    [PromahivaetsyaPriPaltsenosovoyProbe1] NVARCHAR (50) NULL,
    [Afaziya]                              NVARCHAR (50) NULL,
    [RasstroystvoDvizheniya]               NVARCHAR (50) NULL,
    [Gemiplegiya]                          NVARCHAR (1)  NULL,
    [Paraplegiya]                          NVARCHAR (1)  NULL,
    [Tetraplegiya]                         NVARCHAR (1)  NULL,
    [Monoplegiya]                          NVARCHAR (1)  NULL,
    [Gemiparez]                            NVARCHAR (1)  NULL,
    [Paraparez]                            NVARCHAR (1)  NULL,
    [Tetraparez]                           NVARCHAR (1)  NULL,
    [Monoparez]                            NVARCHAR (1)  NULL,
    [Gemiplegiya1]                         NVARCHAR (50) NULL,
    [Gemiparez1]                           NVARCHAR (50) NULL,
    [Tetraparez1]                          NVARCHAR (50) NULL,
    [Paraplegiya1]                         NVARCHAR (50) NULL,
    [Monoplegiya1]                         NVARCHAR (50) NULL,
    [Paraparez1]                           NVARCHAR (50) NULL,
    [Monoparez1]                           NVARCHAR (50) NULL,
    [Dermografizm]                         NVARCHAR (50) NULL,
    [Bistroischezayushiy1]                 NVARCHAR (50) NULL,
    [Bistroischezayushiy]                  NVARCHAR (1)  NULL,
    [GipergidrolizLadoney]                 NVARCHAR (1)  NULL,
    [GipergidrolizStop]                    NVARCHAR (1)  NULL,
    [EmotsionalnoLabilen]                  NVARCHAR (1)  NULL,
    [Zagruzhennost]                        NVARCHAR (1)  NULL,
    [Vyalost]                              NVARCHAR (1)  NULL,
    [SimptomLassega]                       NVARCHAR (1)  NULL,
    [SimptomNeri]                          NVARCHAR (1)  NULL,
    [SimptomPosadki]                       NVARCHAR (1)  NULL,
    [SostoyanieMishtsSpini]                NVARCHAR (50) NULL,
    [ObMDvizheniyPozvonochnika]            NVARCHAR (50) NULL,
    [Gemiplegiya2]                         NVARCHAR (50) NULL,
    [Zagruzhennost1]                       NVARCHAR (1)  NULL,
    [CheckBox1]                            NVARCHAR (1)  NULL,
    [Data]                                 DATETIME      NULL,
    [Vrach]                                NVARCHAR (50) NULL,
    CONSTRAINT [DopolnitelniyOsmotrRefleksoterapevtaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DopolnitelniyOsmotrRefleksoterapevtaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

