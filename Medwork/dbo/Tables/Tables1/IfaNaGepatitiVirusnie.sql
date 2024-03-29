﻿CREATE TABLE [dbo].[IfaNaGepatitiVirusnie] (
    [ID]                     INT          NOT NULL,
    [PatID]                  INT          NULL,
    [NomerAnaliza]           INT          NULL,
    [DataProvedeniyaAnaliza] DATETIME     NULL,
    [VirusGepatitaA]         NVARCHAR (1) NULL,
    [HAVIgM]                 NVARCHAR (1) NULL,
    [HAVIgG]                 NVARCHAR (1) NULL,
    [VirusGepatitaC]         NVARCHAR (1) NULL,
    [antiHCV]                NVARCHAR (1) NULL,
    [VirusGepatitaD]         NVARCHAR (1) NULL,
    [AntiHDV]                NVARCHAR (1) NULL,
    [VirusGepatitaV]         NVARCHAR (1) NULL,
    [HBsAg]                  NVARCHAR (1) NULL,
    [HBlAg]                  NVARCHAR (1) NULL,
    [AntiHBlIgG]             NVARCHAR (1) NULL,
    [IgM]                    NVARCHAR (1) NULL,
    [HbcAg]                  NVARCHAR (1) NULL,
    [AntinvsAgm]             NVARCHAR (1) NULL,
    [IgG]                    NVARCHAR (1) NULL,
    [Vrach]                  INT          NULL,
    CONSTRAINT [IfaNaGepatitiVirusniePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IfaNaGepatitiVirusnieToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

