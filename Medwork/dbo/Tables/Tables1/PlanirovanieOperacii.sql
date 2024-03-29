﻿CREATE TABLE [dbo].[PlanirovanieOperacii] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [AttType]        INT           NULL,
    [AMBST]          INT           NULL,
    [PP]             INT           NULL,
    [DateOper]       DATETIME      NULL,
    [EYE]            INT           NULL,
    [KODISPDL]       INT           NULL,
    [PDiag]          NVARCHAR (3)  NULL,
    [POper]          NVARCHAR (3)  NULL,
    [STADGL]         NVARCHAR (2)  NULL,
    [DIOL]           FLOAT (53)    NULL,
    [TL]             NVARCHAR (3)  NULL,
    [GPT]            NVARCHAR (1)  NULL,
    [Vich]           BIT           NULL,
    [KODRISK]        NVARCHAR (3)  NULL,
    [KODANSIO]       NVARCHAR (3)  NULL,
    [SI]             INT           NULL,
    [KODBRIG]        NVARCHAR (4)  NULL,
    [PRICHINA]       INT           NULL,
    [HOZDOG]         NVARCHAR (20) NULL,
    [HighlightColor] INT           NULL,
    [ZaklFormId]     INT           NULL,
    [NapId]          INT           NULL,
    CONSTRAINT [PlanirovanieOperaciiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PlanirovanieOperaciiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

