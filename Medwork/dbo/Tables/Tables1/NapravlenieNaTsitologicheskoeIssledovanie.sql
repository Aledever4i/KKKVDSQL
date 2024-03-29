﻿CREATE TABLE [dbo].[NapravlenieNaTsitologicheskoeIssledovanie] (
    [ID]                               INT           NOT NULL,
    [PatID]                            INT           NULL,
    [VolumAndDescriptionOfBioMaterial] NTEXT         NULL,
    [LabDescrAndPhone]                 NVARCHAR (50) NULL,
    [InvestigationResult]              NTEXT         NULL,
    [DateMaterialIn]                   DATETIME      NULL,
    [FioVrachProvodIssled]             INT           NULL,
    [OKUD]                             NVARCHAR (50) NULL,
    [OKPO]                             NVARCHAR (50) NULL,
    [OrgName]                          NVARCHAR (50) NULL,
    [NIstBol]                          NVARCHAR (50) NULL,
    [LechVrach]                        INT           NULL,
    [StrahComp]                        NVARCHAR (50) NULL,
    [StrahPolisNo]                     NVARCHAR (50) NULL,
    [Series]                           NVARCHAR (50) NULL,
    [DiagTsitIssled]                   INT           NULL,
    [InstrIssledData]                  NVARCHAR (50) NULL,
    [ProvedennoyeLecheniye]            NVARCHAR (50) NULL,
    [Doza]                             NVARCHAR (50) NULL,
    [CureFrom]                         DATETIME      NULL,
    [CureTo]                           DATETIME      NULL,
    [LocProc]                          NVARCHAR (50) NULL,
    [MarkPrep]                         NVARCHAR (50) NULL,
    [DateBioMaterialTaken]             DATETIME      NULL,
    [VrachNaprMaterial]                INT           NULL,
    [Otdelenie]                        INT           NULL,
    CONSTRAINT [NapravlenieNaTsitologicheskoeIssledovaniePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [NapravlenieNaTsitologicheskoeIssledovanieToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

