﻿CREATE TABLE [dbo].[Avtoperimetriya] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [ProgramaIssledovaniOD]    NVARCHAR (30) NULL,
    [SlepoePytnoOD]            NVARCHAR (19) NULL,
    [CentralnaySkotomaOD]      NVARCHAR (13) NULL,
    [SvetocuvstOD]             INT           NULL,
    [SvetocuvstOD2]            NVARCHAR (20) NULL,
    [ParacentrSkotomiOD]       NVARCHAR (15) NULL,
    [ParacentrSkotomiOD2]      NVARCHAR (15) NULL,
    [ObsheecisloDefOtnositOD]  INT           NULL,
    [ObsheecisloDefAbsolutnOD] INT           NULL,
    [PerifericeskieGraniciOD]  NVARCHAR (10) NULL,
    [SuzheniDOOD]              INT           NULL,
    [SuzheniVOD]               NVARCHAR (15) NULL,
    [SlepoePytnoOS]            NVARCHAR (19) NULL,
    [CentralnaySkotomaOS]      NVARCHAR (13) NULL,
    [SvetocuvstOS]             INT           NULL,
    [SvetocuvstOS2]            NVARCHAR (20) NULL,
    [ParacentrSkotomiOS]       NVARCHAR (15) NULL,
    [ParacentrSkotomiOS2]      NVARCHAR (15) NULL,
    [ObsheecisloDefOtnositOS]  INT           NULL,
    [ObsheecisloDefAbsolutnOS] INT           NULL,
    [PerifericeskieGraniciOS]  NVARCHAR (10) NULL,
    [SuzheniDOOS]              INT           NULL,
    [SuzheniVOS]               NVARCHAR (15) NULL,
    [PriznakPatologiiOD]       NVARCHAR (50) NULL,
    [VeroytnostPatologiiOD]    NVARCHAR (3)  NULL,
    [ZaklucenieOD]             NTEXT         NULL,
    [PriznakPatologiiOD1]      NVARCHAR (50) NULL,
    [VeroytnostPatologiiOD1]   NVARCHAR (3)  NULL,
    [ZaklucenieOD1]            NTEXT         NULL,
    CONSTRAINT [AvtoperimetriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AvtoperimetriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
