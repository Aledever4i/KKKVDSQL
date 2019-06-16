﻿CREATE TABLE [dbo].[VetOsmotrPovtorniy] (
    [ID]                INT            NOT NULL,
    [PatID]             INT            NULL,
    [Data1]             DATETIME       NULL,
    [DinamikaSostPat]   NVARCHAR (50)  NULL,
    [Exam]              NTEXT          NULL,
    [Vrach2]            INT            NULL,
    [DocTime]           DATETIME       NULL,
    [Complains]         NTEXT          NULL,
    [PlanLech2]         NVARCHAR (255) NULL,
    [PlanObsledovaniya] NTEXT          NULL,
    [PlanLecheniya]     NTEXT          NULL,
    [Recomendacii]      NTEXT          NULL,
    [PastTreatment]     NTEXT          NULL,
    [PastTreatmentCb]   NVARCHAR (50)  NULL,
    [PastTreatmentCb2]  NVARCHAR (255) NULL,
    [Specalist]         NVARCHAR (50)  NULL,
    [Exam1]             NTEXT          NULL,
    [DanOsmPovt]        NTEXT          NULL,
    [Obsheesost1]       NVARCHAR (50)  NULL,
    [Temper1]           FLOAT (53)     NULL,
    [sist1]             INT            NULL,
    [diast1]            INT            NULL,
    [Puls]              INT            NULL,
    [Ves3]              FLOAT (53)     NULL,
    [snk]               INT            NULL,
    [CHDD]              INT            NULL,
    [zhalobi1]          NVARCHAR (255) NULL,
    [Zhalobi]           NTEXT          NULL,
    [PriemVStatsionare] NVARCHAR (1)   NULL,
    [Primechanie]       NTEXT          NULL,
    [DataPovtOsmotra]   DATETIME       NULL,
    [Client]            NVARCHAR (50)  NULL,
    [Vid]               NVARCHAR (50)  NULL,
    [Klichka]           NVARCHAR (40)  NULL,
    [AnimalID]          NVARCHAR (20)  NULL,
    [Diagnoz]           NVARCHAR (255) NULL,
    [DiagCode]          NVARCHAR (20)  NULL,
    [Diagnoz1]          NVARCHAR (255) NULL,
    [DiagCode1]         NVARCHAR (20)  NULL,
    [Diagnoz2]          NVARCHAR (255) NULL,
    [DiagCode2]         NVARCHAR (20)  NULL,
    [Diagnoz3]          NVARCHAR (255) NULL,
    [DiagCode3]         NVARCHAR (20)  NULL,
    [Prognoz]           NVARCHAR (100) NULL,
    [LechVrach]         INT            NULL,
    CONSTRAINT [VetOsmotrPovtorniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VetOsmotrPovtorniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
