﻿CREATE TABLE [dbo].[UziMochevogoPuzirya] (
    [ID]                        INT          NOT NULL,
    [PatID]                     INT          NULL,
    [Data]                      DATETIME     NULL,
    [NomerIssledovaniya]        INT          NULL,
    [Naplnenie]                 INT          NULL,
    [Forma]                     INT          NULL,
    [Kontur]                    INT          NULL,
    [SoderzhimoePuzirya]        INT          NULL,
    [Razmer]                    FLOAT (53)   NULL,
    [Razmer1]                   FLOAT (53)   NULL,
    [Razmer2]                   FLOAT (53)   NULL,
    [DopolnitelnieObrazovaniya] NVARCHAR (1) NULL,
    [Lokalizatsiya]             INT          NULL,
    [Kolichestvo]               INT          NULL,
    [RazmerObrazovaniya2]       FLOAT (53)   NULL,
    [RazmerObrazovaniya1]       FLOAT (53)   NULL,
    [RazmerObrazovaniya]        FLOAT (53)   NULL,
    [Struktura]                 INT          NULL,
    [EhoPlotnost]               INT          NULL,
    [DopolnitelnieVklyucheniya] NVARCHAR (1) NULL,
    [Kapsula]                   NVARCHAR (1) NULL,
    [ProrastanieVDrugieOrgani]  NVARCHAR (1) NULL,
    [DopolnitelnieDannieUzi]    NTEXT        NULL,
    [Zaklyuchenie]              INT          NULL,
    [Vrach]                     INT          NULL,
    [Image]                     IMAGE        NULL,
    [DannieNaPechat]            NTEXT        NULL,
    [Konturi]                   INT          NULL,
    CONSTRAINT [UziMochevogoPuziryaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UziMochevogoPuziryaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
