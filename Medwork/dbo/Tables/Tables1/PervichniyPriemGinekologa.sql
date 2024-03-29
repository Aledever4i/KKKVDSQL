﻿CREATE TABLE [dbo].[PervichniyPriemGinekologa] (
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
    [Bol1]                                          NVARCHAR (1)  NULL,
    [Harakter1]                                     NVARCHAR (50) NULL,
    [Lokalizatsiya1]                                NVARCHAR (50) NULL,
    [BolDrugoe1]                                    NVARCHAR (50) NULL,
    [NarushenieMenstrualnoyFunktsii1]               NVARCHAR (1)  NULL,
    [IzmenenieDlitelnosti1]                         NVARCHAR (1)  NULL,
    [AtsiklichnostKrovotecheniy1]                   NVARCHAR (1)  NULL,
    [OtsutstvieKrovotecheniy1]                      NVARCHAR (1)  NULL,
    [IzmenenieIntensivnosti1]                       NVARCHAR (1)  NULL,
    [Zaderzhki2]                                    NVARCHAR (1)  NULL,
    [KrovotecheniePoslePolovogoAkta1]               NVARCHAR (1)  NULL,
    [NarushenieMenstrualnoyFunktsiiDrugoe1]         NVARCHAR (50) NULL,
    [Tsvet1]                                        NVARCHAR (50) NULL,
    [Kolichestvo1]                                  INT           NULL,
    [Videleniya1]                                   NVARCHAR (1)  NULL,
    [UsloviyaPoyavleniya1]                          NVARCHAR (50) NULL,
    [VideleniyaHarakter1]                           NVARCHAR (50) NULL,
    [Drugoe1]                                       NVARCHAR (50) NULL,
    [DrugieRasstroystvaPolovoyFunktsii1]            NVARCHAR (1)  NULL,
    [Zud1]                                          NVARCHAR (1)  NULL,
    [Visipaniya1]                                   NVARCHAR (1)  NULL,
    [Besplodie1]                                    NVARCHAR (1)  NULL,
    [OshushenieMatki1]                              NVARCHAR (1)  NULL,
    [DrugieRasstroystvaPolovoyFunktsiiDrugoe1]      NVARCHAR (50) NULL,
    [RasstroystvaFuntsiySmezhnihOrganov1]           NVARCHAR (1)  NULL,
    [BolPriDefekatsii1]                             NVARCHAR (1)  NULL,
    [BolPriMocheispuskanii1]                        NVARCHAR (1)  NULL,
    [Ponos1]                                        NVARCHAR (1)  NULL,
    [Zapor1]                                        NVARCHAR (1)  NULL,
    [NederzhanieMochi1]                             NVARCHAR (1)  NULL,
    [RasstroystvaFuntsiySmezhnihOrganovDrugoe1]     NVARCHAR (50) NULL,
    [ObshieRastroystva1]                            NVARCHAR (1)  NULL,
    [PlohoeSamochuvstvie1]                          NVARCHAR (1)  NULL,
    [Serdtsebienie1]                                NVARCHAR (1)  NULL,
    [ObshieRastroystvaDrugoe1]                      NVARCHAR (50) NULL,
    [Bessonnitsa1]                                  NVARCHAR (1)  NULL,
    [ObmorochnoeSostoyanie1]                        NVARCHAR (1)  NULL,
    [Ozhirenie1]                                    NVARCHAR (1)  NULL,
    [Pohudenie1]                                    NVARCHAR (1)  NULL,
    [PridatkiSpravaBoleznennie]                     NVARCHAR (1)  NULL,
    [Tyazhistie]                                    NVARCHAR (1)  NULL,
    [PridatkiSpravaUvelicheni]                      NVARCHAR (1)  NULL,
    [MatkaUvelichena]                               NVARCHAR (1)  NULL,
    [DoKakihRazmerov]                               FLOAT (53)    NULL,
    [Konsistentsiya]                                INT           NULL,
    [Forma]                                         INT           NULL,
    [Raspolozhenie]                                 INT           NULL,
    [SvodiSlevaBoleznennie]                         NVARCHAR (1)  NULL,
    [SvodiSlevaGlubokie]                            NVARCHAR (1)  NULL,
    [SvodiSpravaBoleznennie]                        NVARCHAR (1)  NULL,
    [SvodiSpravaGlubokie]                           NVARCHAR (1)  NULL,
    [BezOsobennostey]                               NVARCHAR (1)  NULL,
    [ParametriyOsobennosti]                         NVARCHAR (50) NULL,
    [PridatkiSpravaKonglomerat]                     NVARCHAR (50) NULL,
    [PridatkiSpravaDrugoe]                          NVARCHAR (50) NULL,
    [PridatkiSlevaBoleznennie]                      NVARCHAR (1)  NULL,
    [PridatkiSlevaTyazhistie]                       NVARCHAR (1)  NULL,
    [PridatkiSlevaUvelicheni]                       NVARCHAR (1)  NULL,
    [PridatkiSlevaKonglomerat]                      NVARCHAR (50) NULL,
    [PridatkiSlevaDrugoe]                           NVARCHAR (50) NULL,
    [PervieSimptomiNachaloZabolevaniya]             NVARCHAR (50) NULL,
    [NachaloZabolevaniyaDrugoe]                     NVARCHAR (50) NULL,
    [Abort]                                         NVARCHAR (1)  NULL,
    [Travma]                                        NVARCHAR (1)  NULL,
    [Pereohlazhdenie]                               NVARCHAR (1)  NULL,
    [PolovoeSnoshenie]                              NVARCHAR (1)  NULL,
    [Rodi]                                          NVARCHAR (1)  NULL,
    [GdeIKogdaLechilas]                             NVARCHAR (50) NULL,
    [MetogdiLecheniya]                              NVARCHAR (50) NULL,
    [EffektOtLecheniya]                             NVARCHAR (1)  NULL,
    [Retsidivi]                                     NVARCHAR (1)  NULL,
    [OtyagoshennayaNasledstvennost]                 NVARCHAR (1)  NULL,
    [ProdolzhitelnostMenstrualnogoTsikla]           INT           NULL,
    [Nachalo]                                       DATETIME      NULL,
    [Konets]                                        DATETIME      NULL,
    [GinekologicheskiyAnamnezBol]                   NVARCHAR (1)  NULL,
    [Zaderzhki1]                                    NVARCHAR (1)  NULL,
    [Kontratseptsiya]                               NVARCHAR (1)  NULL,
    [Brak]                                          NVARCHAR (1)  NULL,
    [Medaborti]                                     INT           NULL,
    [ObsheeChisloBeremennosteyRodi]                 INT           NULL,
    [ObsheeChisloBeremennostey]                     INT           NULL,
    [VKakomVozrasteNachalaPolovuyuZhizn]            INT           NULL,
    [VideleniyaPriMenstruatsii]                     INT           NULL,
    [SamoproizvolnieVikidishi]                      INT           NULL,
    [PrezhdevremennieRodi]                          INT           NULL,
    [Mertvorozhdeniya]                              NVARCHAR (50) NULL,
    [Oslozhneniya]                                  NVARCHAR (50) NULL,
    [Menarhe]                                       DATETIME      NULL,
    [Pravilnie]                                     NVARCHAR (1)  NULL,
    [VlagalisheRozhavshey]                          NVARCHAR (1)  NULL,
    [VlagalisheNerozhavshey]                        NVARCHAR (1)  NULL,
    [SheykaMatkiForma]                              INT           NULL,
    [DisplaziyaEpiteliya]                           NVARCHAR (1)  NULL,
    [Ektropion]                                     NVARCHAR (1)  NULL,
    [SheykaMatkiVideleniya]                         NVARCHAR (1)  NULL,
    [Kondilomi]                                     NVARCHAR (1)  NULL,
    [Polipi]                                        NVARCHAR (1)  NULL,
    [Eroziya]                                       NVARCHAR (1)  NULL,
    [IssledovanieCharezPryamuyuKishku]              NVARCHAR (50) NULL,
    [Zaklyuchenie]                                  NVARCHAR (50) NULL,
    [MazkiNaFloru]                                  NVARCHAR (1)  NULL,
    [UziOrganovMalogoTaza]                          NVARCHAR (1)  NULL,
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
    [DopDannie]                                     NTEXT         NULL,
    [Kommentrariy]                                  NTEXT         NULL,
    CONSTRAINT [PervichniyPriemGinekologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PervichniyPriemGinekologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

