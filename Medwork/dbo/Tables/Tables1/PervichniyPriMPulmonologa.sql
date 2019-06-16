﻿CREATE TABLE [dbo].[PervichniyPriMPulmonologa] (
    [ID]                                            INT           NOT NULL,
    [PatID]                                         INT           NULL,
    [Zhalobi]                                       NTEXT         NULL,
    [AnamnezZabolevaniya]                           NTEXT         NULL,
    [Inektsii]                                      NVARCHAR (1)  NULL,
    [LechenieUStomatologa]                          NVARCHAR (1)  NULL,
    [Operatsii]                                     NVARCHAR (1)  NULL,
    [Transfuzii]                                    NVARCHAR (1)  NULL,
    [Tb]                                            NVARCHAR (1)  NULL,
    [Vich]                                          NVARCHAR (1)  NULL,
    [Malyariya]                                     NVARCHAR (1)  NULL,
    [Tif]                                           NVARCHAR (1)  NULL,
    [Paratif]                                       NVARCHAR (1)  NULL,
    [Gepatit]                                       NVARCHAR (1)  NULL,
    [ObektivniyStatus]                              NTEXT         NULL,
    [ObsheeSostoyanie]                              INT           NULL,
    [TemperaturaTela]                               FLOAT (53)    NULL,
    [VirazhenieLitsa]                               INT           NULL,
    [OrganiDihaniya]                                NTEXT         NULL,
    [VidimieSlizistie]                              INT           NULL,
    [VidimieSlizistie1]                             INT           NULL,
    [Visipaniya]                                    NVARCHAR (25) NULL,
    [LimfaticheskieUzli1]                           NTEXT         NULL,
    [ZevKrasnota1]                                  NVARCHAR (1)  NULL,
    [ZevPripuhlost1]                                NVARCHAR (1)  NULL,
    [ZevNalet1]                                     NVARCHAR (1)  NULL,
    [Zev1]                                          NTEXT         NULL,
    [AnamnezZhizni]                                 NTEXT         NULL,
    [AnamnezZhizni1]                                NTEXT         NULL,
    [AnamnezZhizni2]                                NTEXT         NULL,
    [AnamnezZhizni3]                                NTEXT         NULL,
    [Medikamentov]                                  NTEXT         NULL,
    [Produktov]                                     NTEXT         NULL,
    [NalichieOslozhneniyTransfuzii]                 NTEXT         NULL,
    [GruppaKrovi]                                   NVARCHAR (50) NULL,
    [Rh]                                            NVARCHAR (50) NULL,
    [TransfuziiRanshe]                              NVARCHAR (50) NULL,
    [BitovieUsloviya]                               NVARCHAR (50) NULL,
    [LichnayaGigiena]                               NVARCHAR (50) NULL,
    [UpotreblenieNarkotikov]                        NVARCHAR (50) NULL,
    [IstochnikPitevoyVodi]                          NVARCHAR (50) NULL,
    [UpotreblenieSiroyVodi]                         NVARCHAR (50) NULL,
    [NalichieTbVichMalyariiTifaParatifaGepatitaZpp] NVARCHAR (50) NULL,
    [Zpp]                                           NVARCHAR (50) NULL,
    [Data]                                          DATETIME      NULL,
    [Vrach]                                         INT           NULL,
    CONSTRAINT [PervichniyPriMPulmonologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PervichniyPriMPulmonologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

