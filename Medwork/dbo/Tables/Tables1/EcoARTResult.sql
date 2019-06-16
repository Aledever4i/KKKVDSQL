﻿CREATE TABLE [dbo].[EcoARTResult] (
    [ID]                        INT           NOT NULL,
    [PatID]                     INT           NULL,
    [HG]                        FLOAT (53)    NULL,
    [HGDate]                    DATETIME      NULL,
    [Paratsentez]               NVARCHAR (1)  NULL,
    [Trans1ID]                  INT           NULL,
    [Trans2ID]                  INT           NULL,
    [TransKind]                 NVARCHAR (50) NULL,
    [OHS]                       NVARCHAR (20) NULL,
    [PregType]                  NVARCHAR (20) NULL,
    [ClinicPregType]            NVARCHAR (30) NULL,
    [FetalSac]                  INT           NULL,
    [Embryos]                   INT           NULL,
    [Heartbeats]                INT           NULL,
    [ResultKind]                NVARCHAR (15) NULL,
    [MInsemID]                  INT           NULL,
    [NonDevelopingPregnancy]    NVARCHAR (10) NULL,
    [NonDevelopingPregnancyAge] NVARCHAR (50) NULL,
    [Miscarriage]               NVARCHAR (10) NULL,
    [MiscarriageAge]            NVARCHAR (50) NULL,
    [SelfReduction]             NVARCHAR (10) NULL,
    [SelfReductionLeft]         INT           NULL,
    [SurgicalReduction]         NVARCHAR (10) NULL,
    [SurgicalReductionLeft]     INT           NULL,
    [Abortion]                  NVARCHAR (10) NULL,
    [AbortionAge]               NVARCHAR (50) NULL,
    [PregnancyComplications]    NVARCHAR (10) NULL,
    [BleedingBefore12Weeks]     NVARCHAR (10) NULL,
    [ThreatOfInterruption]      NVARCHAR (10) NULL,
    [ThreatOfPretermBirth]      NVARCHAR (10) NULL,
    [ToxicosisOf2Half]          NVARCHAR (15) NULL,
    [PlacentaPrevia]            NVARCHAR (10) NULL,
    [Mazolysis]                 NVARCHAR (10) NULL,
    [AntenatalFetalDeath]       NVARCHAR (10) NULL,
    [AntenatalFetalDeathCount]  INT           NULL,
    [PretermBirth]              NVARCHAR (10) NULL,
    [PretermBirthAge]           INT           NULL,
    [PretermBirthMethod]        NVARCHAR (20) NULL,
    [UrgentBirth]               NVARCHAR (10) NULL,
    [UrgentBirthAge]            INT           NULL,
    [UrgentBirthMethod]         NVARCHAR (20) NULL,
    [DataRodov]                 DATETIME      NULL,
    CONSTRAINT [EcoTransResultPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EcoTransResultToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idxEcoARTResult_ResultKind]
    ON [dbo].[EcoARTResult]([ResultKind] ASC);
