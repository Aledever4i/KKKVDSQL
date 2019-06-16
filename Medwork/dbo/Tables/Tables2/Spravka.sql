﻿CREATE TABLE [dbo].[Spravka] (
    [ID]            INT           NOT NULL,
    [PatID]         INT           NULL,
    [TipSpravki]    NVARCHAR (50) NULL,
    [Pacient]       NTEXT         NULL,
    [Diagnoz]       NTEXT         NULL,
    [LechilS]       DATETIME      NULL,
    [LechilPo]      DATETIME      NULL,
    [Doctor]        NVARCHAR (50) NULL,
    [Doctor1]       NVARCHAR (50) NULL,
    [NoSpravki]     NVARCHAR (50) NULL,
    [Pacient1]      NTEXT         NULL,
    [f20]           NVARCHAR (50) NULL,
    [Obrabotka]     NVARCHAR (50) NULL,
    [DataObr]       NVARCHAR (50) NULL,
    [Pacient2]      NTEXT         NULL,
    [DR]            DATETIME      NULL,
    [Lechenie]      NVARCHAR (50) NULL,
    [Vstacionare]   NVARCHAR (50) NULL,
    [Vskarmlivanie] NVARCHAR (50) NULL,
    [RebenokNaSif]  NVARCHAR (50) NULL,
    [Data]          DATETIME      NULL,
    [Doctor2]       NVARCHAR (50) NULL,
    CONSTRAINT [SpravkaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SpravkaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
