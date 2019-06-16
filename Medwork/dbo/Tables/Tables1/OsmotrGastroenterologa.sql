﻿CREATE TABLE [dbo].[OsmotrGastroenterologa] (
    [ID]                               INT           NOT NULL,
    [PatID]                            INT           NULL,
    [Data]                             DATETIME      NULL,
    [Vrach]                            NVARCHAR (50) NULL,
    [Bol]                              NVARCHAR (50) NULL,
    [Bol1]                             NVARCHAR (50) NULL,
    [Bol2]                             NVARCHAR (50) NULL,
    [SIrradiatsiey]                    NVARCHAR (1)  NULL,
    [SIrradiatsiey1]                   NVARCHAR (50) NULL,
    [BezIrradiatsii]                   NVARCHAR (1)  NULL,
    [BezIrradiatsii1]                  NVARCHAR (50) NULL,
    [Lokalizatsiya]                    NVARCHAR (50) NULL,
    [SvyazSPriMomPishi]                NVARCHAR (50) NULL,
    [VKakoeVremya]                     NVARCHAR (50) NULL,
    [DopolnitelnieSvedeniya]           NTEXT         NULL,
    [Appetit]                          NVARCHAR (50) NULL,
    [Toshnota]                         NVARCHAR (1)  NULL,
    [Toshnota1]                        NVARCHAR (50) NULL,
    [Rvota]                            NVARCHAR (1)  NULL,
    [Rvota1]                           NVARCHAR (50) NULL,
    [Izzhoga]                          NVARCHAR (1)  NULL,
    [Izzhoga1]                         NVARCHAR (50) NULL,
    [Meteorizm]                        NVARCHAR (1)  NULL,
    [Meteorizm1]                       NVARCHAR (50) NULL,
    [Zapor]                            NVARCHAR (1)  NULL,
    [Zapor1]                           NVARCHAR (50) NULL,
    [Ponos]                            NVARCHAR (1)  NULL,
    [Ponos1]                           NVARCHAR (50) NULL,
    [Otrizhka]                         NVARCHAR (1)  NULL,
    [Otrizhka1]                        NVARCHAR (50) NULL,
    [Disfagiya]                        NVARCHAR (1)  NULL,
    [Disfagiya1]                       NVARCHAR (50) NULL,
    [AktDefekatsii]                    NVARCHAR (50) NULL,
    [Tsvet]                            NVARCHAR (50) NULL,
    [Stul]                             NVARCHAR (50) NULL,
    [SPrimesyu]                        NVARCHAR (50) NULL,
    [Mocha]                            NVARCHAR (50) NULL,
    [NalichieDomashnihZhivotnih]       NVARCHAR (50) NULL,
    [ViezdiZaPredeliMestaProzhivaniya] NVARCHAR (1)  NULL,
    [RekomenduemieIssledovaniya]       NTEXT         NULL,
    [Lechenie]                         NTEXT         NULL,
    [Zaklyuchenie]                     NTEXT         NULL,
    [KodPoMkb10]                       NVARCHAR (10) NULL,
    [DiagnozPoMkb10]                   NVARCHAR (80) NULL,
    CONSTRAINT [OsmotrGastroenterologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrGastroenterologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
