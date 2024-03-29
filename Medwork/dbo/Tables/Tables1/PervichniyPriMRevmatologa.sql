﻿CREATE TABLE [dbo].[PervichniyPriMRevmatologa] (
    [ID]                                            INT           NOT NULL,
    [PatID]                                         INT           NULL,
    [Zhalobi]                                       NTEXT         NULL,
    [AnamnezZabolevaniya]                           NTEXT         NULL,
    [Memo6]                                         NTEXT         NULL,
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
    [LimfaticheskieUzli1]                           NTEXT         NULL,
    [KoltsevayaEritema]                             NVARCHAR (1)  NULL,
    [RevmaticheskihUzelkovVOblastiSustavov]         NVARCHAR (1)  NULL,
    [NasilstvennihGiperkinezovMishtsHoreya]         NVARCHAR (1)  NULL,
    [PerenesenaAngina]                              NVARCHAR (1)  NULL,
    [EffektivnostTerapiiNpvpIGks]                   NVARCHAR (1)  NULL,
    [Vlazhnost]                                     INT           NULL,
    [OkraskaKozhnihPokrovov]                        INT           NULL,
    [Oteki]                                         INT           NULL,
    [Oteki1]                                        NVARCHAR (45) NULL,
    [LimfaticheskieUzli]                            INT           NULL,
    [Sustavi]                                       INT           NULL,
    [Boleznennost]                                  INT           NULL,
    [Konfiguratsiya]                                INT           NULL,
    [TsvetKozhiNadSustavami]                        INT           NULL,
    [Kontraktura]                                   NVARCHAR (1)  NULL,
    [BolPriDvizhenii]                               NVARCHAR (1)  NULL,
    [TsvetKozhiNadSustavami1]                       INT           NULL,
    [Zev]                                           NVARCHAR (33) NULL,
    [Uvelicheni]                                    NVARCHAR (1)  NULL,
    [Udaleni]                                       NVARCHAR (1)  NULL,
    [Giperemiya]                                    NVARCHAR (1)  NULL,
    [Dihanie]                                       INT           NULL,
    [Hripi]                                         INT           NULL,
    [Hripi1]                                        INT           NULL,
    [GranitsiSerdtsa]                               INT           NULL,
    [Puls]                                          INT           NULL,
    [UdovlSvV]                                      NVARCHAR (1)  NULL,
    [Napolnenie]                                    INT           NULL,
    [Napryazhenie1]                                 INT           NULL,
    [ToniSerdtsa1]                                  INT           NULL,
    [VerhushechniyTolchok]                          INT           NULL,
    [AkcentVtorogoTonaNadLegochnoyArteriey]         NVARCHAR (1)  NULL,
    [ShumiSerdtsa]                                  NVARCHAR (33) NULL,
    [NadSosudami]                                   NVARCHAR (35) NULL,
    [AdNaPravoyRuke1]                               INT           NULL,
    [AdNaPravoyRuke]                                INT           NULL,
    [AdNaLevoyRuke1]                                INT           NULL,
    [AdNaLevoyRuke]                                 INT           NULL,
    [AdNaLevoyRuke2]                                INT           NULL,
    [AdNaLevoyRuke3]                                INT           NULL,
    [AdNaPravoyRuke2]                               INT           NULL,
    [AdNaPravoyRuke3]                               INT           NULL,
    [PechenIzPodreberyaNa]                          FLOAT (53)    NULL,
    [Harakteristika]                                NVARCHAR (60) NULL,
    [Pochki]                                        NVARCHAR (35) NULL,
    [Selezenka]                                     NVARCHAR (33) NULL,
    [PredvaritelniyDiagnoz]                         NTEXT         NULL,
    [AnamnezZhizni]                                 NTEXT         NULL,
    [AnamnezZhizni1]                                NTEXT         NULL,
    [AnamnezZhizni2]                                NTEXT         NULL,
    [AnamnezZhizni3]                                NTEXT         NULL,
    [Medikamentov]                                  NTEXT         NULL,
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
    [AkcentVtorogoTonaNadLegochnoyAortoy]           NVARCHAR (1)  NULL,
    [Data]                                          DATETIME      NULL,
    [Vrachi]                                        NVARCHAR (50) NULL,
    [Produktov]                                     NTEXT         NULL,
    CONSTRAINT [PervichniyPriMRevmatologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PervichniyPriMRevmatologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

