﻿CREATE TABLE [dbo].[PervichniyPriMOkulista] (
    [ID]                                            INT            NOT NULL,
    [PatID]                                         INT            NULL,
    [Zhalobi]                                       NTEXT          NULL,
    [AnamnezZabolevaniya]                           NTEXT          NULL,
    [Memo7]                                         NTEXT          NULL,
    [Inektsii]                                      NVARCHAR (1)   NULL,
    [LechenieUStomatologa]                          NVARCHAR (1)   NULL,
    [Operatsii]                                     NVARCHAR (1)   NULL,
    [Transfuzii]                                    NVARCHAR (1)   NULL,
    [Tb]                                            NVARCHAR (1)   NULL,
    [Vich]                                          NVARCHAR (1)   NULL,
    [Malyariya]                                     NVARCHAR (1)   NULL,
    [Tif]                                           NVARCHAR (1)   NULL,
    [Paratif]                                       NVARCHAR (1)   NULL,
    [Gepatit]                                       NVARCHAR (1)   NULL,
    [PeredniaKameraVNorme]                          NVARCHAR (1)   NULL,
    [BezKorrektsiiR]                                FLOAT (53)     NULL,
    [BezKorrektsiiL]                                FLOAT (53)     NULL,
    [SKorrektsieyL]                                 NVARCHAR (50)  NULL,
    [SKorrektsieyR]                                 NVARCHAR (50)  NULL,
    [Orbita]                                        NVARCHAR (50)  NULL,
    [PolozhenieGlaz]                                NVARCHAR (50)  NULL,
    [DvigatelniyApparat]                            NVARCHAR (50)  NULL,
    [Utolshen]                                      NVARCHAR (1)   NULL,
    [Cheshuiki]                                     NVARCHAR (1)   NULL,
    [Iazvochki]                                     NVARCHAR (1)   NULL,
    [Trihiaz]                                       NVARCHAR (1)   NULL,
    [ResnichniyKray]                                INT            NULL,
    [KonyuktivaVek]                                 NVARCHAR (200) NULL,
    [Otdelyaemoe]                                   INT            NULL,
    [SleznieOrganyVNorme]                           NVARCHAR (1)   NULL,
    [Prohodimost]                                   INT            NULL,
    [Prohodimost1]                                  NVARCHAR (50)  NULL,
    [SkleraVNorme]                                  NVARCHAR (1)   NULL,
    [Sklera]                                        INT            NULL,
    [Sklera1]                                       INT            NULL,
    [Sklera2]                                       NVARCHAR (50)  NULL,
    [RogovicaVNorme]                                NVARCHAR (1)   NULL,
    [Rogovitsa]                                     INT            NULL,
    [Rogovitsa1]                                    INT            NULL,
    [Rogovitsa2]                                    NVARCHAR (50)  NULL,
    [PerednyayaKamera]                              INT            NULL,
    [PerednyayaKamera1]                             INT            NULL,
    [Vlaga]                                         NVARCHAR (50)  NULL,
    [RaduzhkaVNorme]                                NVARCHAR (1)   NULL,
    [Raduzhka]                                      NVARCHAR (50)  NULL,
    [Zrachok]                                       NVARCHAR (50)  NULL,
    [Zrachok1]                                      INT            NULL,
    [HrustalikVNorme]                               NVARCHAR (1)   NULL,
    [Hrustalik]                                     INT            NULL,
    [Hrustalik1]                                    INT            NULL,
    [Hrustalik2]                                    NVARCHAR (50)  NULL,
    [SteklovidnoeTelo]                              INT            NULL,
    [SteklovidnoeTelo1]                             NVARCHAR (50)  NULL,
    [GlaznoeDnoVNorme]                              NVARCHAR (1)   NULL,
    [ObektivniyStatus]                              NTEXT          NULL,
    [ZritelniyNerv1]                                NTEXT          NULL,
    [Sosudi1]                                       NTEXT          NULL,
    [Setchatka1]                                    NTEXT          NULL,
    [VnutriglaznoeDavlenie1]                        NTEXT          NULL,
    [ObektivnayaRefraktsiya1]                       NTEXT          NULL,
    [AnamnezZhizni]                                 NTEXT          NULL,
    [AnamnezZhizni1]                                NTEXT          NULL,
    [AnamnezZhizni2]                                NTEXT          NULL,
    [AnamnezZhizni3]                                NTEXT          NULL,
    [Medikamentov]                                  NTEXT          NULL,
    [Produktov]                                     NTEXT          NULL,
    [GruppaKrovi]                                   NVARCHAR (50)  NULL,
    [Rh]                                            NVARCHAR (50)  NULL,
    [TransfuziiRanshe]                              NVARCHAR (50)  NULL,
    [BitovieUsloviya]                               NVARCHAR (50)  NULL,
    [LichnayaGigiena]                               NVARCHAR (50)  NULL,
    [UpotreblenieNarkotikov]                        NVARCHAR (50)  NULL,
    [IstochnikPitevoyVodi]                          NVARCHAR (50)  NULL,
    [UpotreblenieSiroyVodi]                         NVARCHAR (50)  NULL,
    [NalichieTbVichMalyariiTifaParatifaGepatitaZpp] NVARCHAR (50)  NULL,
    [Zpp]                                           NVARCHAR (50)  NULL,
    [SteklovidnoeTelo2]                             NVARCHAR (1)   NULL,
    [GlaznoeDno]                                    NVARCHAR (50)  NULL,
    [Dopolnitelno]                                  NTEXT          NULL,
    [Data]                                          DATETIME       NULL,
    [Vrach]                                         INT            NULL,
    [Zaklyuchenie]                                  NVARCHAR (50)  NULL,
    [Kommentrariy]                                  NTEXT          NULL,
    CONSTRAINT [PervichniyPriMOkulistaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PervichniyPriMOkulistaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

