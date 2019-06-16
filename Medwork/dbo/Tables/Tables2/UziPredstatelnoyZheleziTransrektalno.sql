﻿CREATE TABLE [dbo].[UziPredstatelnoyZheleziTransrektalno] (
    [ID]                      INT          NOT NULL,
    [PatID]                   INT          NULL,
    [Data]                    DATETIME     NULL,
    [NomerIssledovaniya]      INT          NULL,
    [Vid]                     INT          NULL,
    [Razmer]                  FLOAT (53)   NULL,
    [Razmer1]                 FLOAT (53)   NULL,
    [Razmer2]                 FLOAT (53)   NULL,
    [Kontur]                  INT          NULL,
    [Chetkost]                INT          NULL,
    [KonturBugristiy]         NVARCHAR (1) NULL,
    [KonturPolitsiklicheskiy] NVARCHAR (1) NULL,
    [Kapsula]                 INT          NULL,
    [Struktura]               INT          NULL,
    [EhoPlotnost]             INT          NULL,
    [Kaltsifikati]            NVARCHAR (1) NULL,
    [OchagovieObrazovaniya]   NVARCHAR (1) NULL,
    [Kolichestvo]             INT          NULL,
    [Kontur1]                 INT          NULL,
    [EhoPlotnost1]            INT          NULL,
    [Struktura1]              INT          NULL,
    [Razmeri]                 FLOAT (53)   NULL,
    [Razmeri1]                FLOAT (53)   NULL,
    [Razmeri2]                FLOAT (53)   NULL,
    [Chetkost1]               INT          NULL,
    [Forma]                   INT          NULL,
    [KaltsifikatiOO]          NVARCHAR (1) NULL,
    [KapsulaOO]               NVARCHAR (1) NULL,
    [Vrach]                   INT          NULL,
    [DopolnitelnieDannieUzi]  NTEXT        NULL,
    [Zaklyuchenie]            INT          NULL,
    [Image]                   IMAGE        NULL,
    [DannieNaPechat]          NTEXT        NULL,
    CONSTRAINT [UziPredstatelnoyZheleziTransrektalnoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UziPredstatelnoyZheleziTransrektalnoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
