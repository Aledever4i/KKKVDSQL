﻿CREATE TABLE [dbo].[LgotniyRetsept] (
    [ID]                  INT            NOT NULL,
    [PatID]               INT            NULL,
    [PatName]             NVARCHAR (100) NULL,
    [Sex]                 NVARCHAR (50)  NULL,
    [SNILS]               NVARCHAR (50)  NULL,
    [OMSPolisy]           NVARCHAR (50)  NULL,
    [Age]                 NVARCHAR (50)  NULL,
    [DiagDict]            NVARCHAR (50)  NULL,
    [Diag]                NVARCHAR (6)   NULL,
    [Lgota]               NVARCHAR (100) NULL,
    [Skidka]              NVARCHAR (50)  NULL,
    [Validaty]            NVARCHAR (50)  NULL,
    [SourceFinancial]     NVARCHAR (100) NULL,
    [DrugMnn]             NVARCHAR (100) NULL,
    [DrugTrade]           NVARCHAR (255) NULL,
    [CountDrug]           INT            NULL,
    [Dosage]              NVARCHAR (255) NULL,
    [Primenenie]          NTEXT          NULL,
    [LekForma]            NVARCHAR (255) NULL,
    [Production]          NVARCHAR (255) NULL,
    [DrugID]              INT            NULL,
    [CountDrugDay]        NVARCHAR (50)  NULL,
    [PeriodPriema]        NVARCHAR (50)  NULL,
    [EdOne]               NVARCHAR (50)  NULL,
    [RP]                  NVARCHAR (255) NULL,
    [AuthorID]            INT            NULL,
    [isMedicalCommission] NVARCHAR (1)   NULL,
    [Vrach]               NVARCHAR (50)  NULL,
    [Seriya]              NVARCHAR (50)  NULL,
    [Nomer]               NVARCHAR (50)  NULL,
    [Data]                DATETIME       NULL,
    [KodLgota]            NVARCHAR (50)  NULL,
    CONSTRAINT [LgotniyRetseptPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LgotniyRetseptToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

