﻿CREATE TABLE [dbo].[PovtorniyPriMAngiohirurga] (
    [ID]                              INT           NOT NULL,
    [PatID]                           INT           NULL,
    [Vrach]                           INT           NULL,
    [Data]                            DATETIME      NULL,
    [PredvaritelniyDiagnoz]           NTEXT         NULL,
    [ObektivniyStatus]                NTEXT         NULL,
    [SosudiVerhnihKonechnostey]       NTEXT         NULL,
    [SosudiNizhnihKonechnostey]       NTEXT         NULL,
    [PulsNaLevoySonnoyArterii]        INT           NULL,
    [PulsNaPravoySonnoyArterii]       INT           NULL,
    [AdNaPravoyVerhneyKonechnosti]    INT           NULL,
    [AdNaPravoyVerhneyKonechnosti2]   INT           NULL,
    [AdNaPravoyNizhneyKonechnosti2]   INT           NULL,
    [AdNaPravoyNizhneyKonechnosti]    INT           NULL,
    [AdNaLevoyVerhneyKonechnosti]     INT           NULL,
    [AdNaLevoyNizhneyKonechnosti]     INT           NULL,
    [AdNaLevoyNizhneyKonechnosti2]    INT           NULL,
    [AdNaLevoyVerhneyKonechnosti2]    INT           NULL,
    [PulsatsiyaBryushnoyChastiAorti1] NVARCHAR (1)  NULL,
    [KozhniePokrovi]                  NVARCHAR (60) NULL,
    [DopolnitelnieDannie]             NVARCHAR (50) NULL,
    CONSTRAINT [PovtorniyPriMAngiohirurgaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMAngiohirurgaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

