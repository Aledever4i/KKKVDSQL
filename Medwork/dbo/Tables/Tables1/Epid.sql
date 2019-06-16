﻿CREATE TABLE [dbo].[Epid] (
    [ID]                INT           NOT NULL,
    [PatID]             INT           NULL,
    [MasterID]          INT           NULL,
    [NazvanieAllergena] NVARCHAR (50) NULL,
    [Seriya]            NVARCHAR (50) NULL,
    [Rezultat]          NVARCHAR (50) NULL,
    CONSTRAINT [EpidPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EpidToKonsultatsiyaAllergologa] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[KonsultatsiyaAllergologa] ([ID]) ON DELETE CASCADE
);

