﻿CREATE TABLE [dbo].[PervichniyPriemKardiologa] (
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
    [OkraskaKozhnihPokrovov]                        INT           NULL,
    [Vlazhnost]                                     INT           NULL,
    [Oteki]                                         INT           NULL,
    [Oteki1]                                        NVARCHAR (45) NULL,
    [LimfaticheskieUzli1]                           NVARCHAR (45) NULL,
    [LimfaticheskieUzli]                            INT           NULL,
    [Sustavi]                                       INT           NULL,
    [Boleznennost]                                  INT           NULL,
    [Konfiguratsiya1]                               NVARCHAR (45) NULL,
    [Konfiguratsiya]                                INT           NULL,
    [Kontraktura]                                   NVARCHAR (1)  NULL,
    [Ankiloz]                                       NVARCHAR (1)  NULL,
    [Zev]                                           NVARCHAR (33) NULL,
    [Mindalini]                                     NVARCHAR (35) NULL,
    [Hripi]                                         INT           NULL,
    [Hripi1]                                        INT           NULL,
    [Dihanie]                                       INT           NULL,
    [GranitsiSerdtsa]                               INT           NULL,
    [Puls]                                          INT           NULL,
    [Napolnenie]                                    INT           NULL,
    [Napryazhenie]                                  INT           NULL,
    [ToniSerdtsa]                                   INT           NULL,
    [VerhushechniyTolchok]                          INT           NULL,
    [ShumiSerdtsa]                                  NVARCHAR (33) NULL,
    [NadSosudami]                                   NVARCHAR (35) NULL,
    [AdNaLevoyRuke]                                 INT           NULL,
    [AdNaLevoyRuke1]                                INT           NULL,
    [AdNaPravoyRuke]                                INT           NULL,
    [AdNaPravoyRuke1]                               INT           NULL,
    [RazmeriPecheniPoKurlovu]                       FLOAT (53)    NULL,
    [Harakteristika]                                NVARCHAR (60) NULL,
    [Selezenka]                                     NVARCHAR (33) NULL,
    [Dopolnitelno]                                  NTEXT         NULL,
    [DihaniePrimechanie]                            NTEXT         NULL,
    [AktsentVtorogoTonaNadAortoy]                   INT           NULL,
    [NadLegochnoyArteriey]                          INT           NULL,
    [RazmeriPecheniPoKurlovu1]                      FLOAT (53)    NULL,
    [RazmeriPecheniPoKurlovu2]                      FLOAT (53)    NULL,
    [Defitsit]                                      INT           NULL,
    [Mocheispuskanie]                               INT           NULL,
    [PredvaritelniyDiagnoz]                         NTEXT         NULL,
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
    [Vrach]                                         NVARCHAR (50) NULL,
    CONSTRAINT [PervichniyPriemKardiologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PervichniyPriemKardiologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

