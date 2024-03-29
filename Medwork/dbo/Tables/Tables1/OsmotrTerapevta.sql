﻿CREATE TABLE [dbo].[OsmotrTerapevta] (
    [ID]                                            INT           NOT NULL,
    [PatID]                                         INT           NULL,
    [Zhalobi]                                       NTEXT         NULL,
    [PerenesennieZabolevaniya]                      NTEXT         NULL,
    [Allergoanamnez]                                NTEXT         NULL,
    [Nasledstvennost]                               NTEXT         NULL,
    [ObektivnieDannie]                              NTEXT         NULL,
    [Gemotransfuzii]                                NTEXT         NULL,
    [IstoriyaBolezni]                               NTEXT         NULL,
    [PredvaritelniyDiagnoz]                         NTEXT         NULL,
    [Dieta]                                         NTEXT         NULL,
    [MedikamentoznayaTerapiya]                      NTEXT         NULL,
    [DopolnitelnieNaznacheniya]                     NTEXT         NULL,
    [BolnichniyListNomer]                           NVARCHAR (50) NULL,
    [S]                                             DATETIME      NULL,
    [Po]                                            DATETIME      NULL,
    [PovtornayaYavka]                               DATETIME      NULL,
    [Vremya]                                        NVARCHAR (50) NULL,
    [KTrudu]                                        DATETIME      NULL,
    [Primechaniya]                                  NTEXT         NULL,
    [DataOsmotra]                                   DATETIME      NULL,
    [Kurenie]                                       NVARCHAR (1)  NULL,
    [Alkogol]                                       NVARCHAR (1)  NULL,
    [Narkotiki]                                     NVARCHAR (1)  NULL,
    [Rezhim]                                        NVARCHAR (50) NULL,
    [DobavitRekomendatsii]                          NVARCHAR (1)  NULL,
    [Vrach]                                         NVARCHAR (50) NULL,
    [DictCombo1]                                    NVARCHAR (50) NULL,
    [Data]                                          DATETIME      NULL,
    [AnamnezZhizni]                                 NTEXT         NULL,
    [AnamnezZhizni1]                                NTEXT         NULL,
    [AnamnezZhizni2]                                NTEXT         NULL,
    [Zhalobi1]                                      NTEXT         NULL,
    [AnamnezZabolevaniya]                           NTEXT         NULL,
    [Medikamentov]                                  NTEXT         NULL,
    [Produktov]                                     NTEXT         NULL,
    [Inektsii]                                      NVARCHAR (1)  NULL,
    [LechenieUStomatologa]                          NVARCHAR (1)  NULL,
    [Operatsii]                                     NVARCHAR (1)  NULL,
    [Transfuzii]                                    NVARCHAR (1)  NULL,
    [NalichieTbVichMalyariiTifaParatifaGepatitaZpp] NVARCHAR (50) NULL,
    [Tb]                                            NVARCHAR (1)  NULL,
    [Vich]                                          NVARCHAR (1)  NULL,
    [Malyariya]                                     NVARCHAR (1)  NULL,
    [Tif]                                           NVARCHAR (1)  NULL,
    [Paratif]                                       NVARCHAR (1)  NULL,
    [Gepatit]                                       NVARCHAR (1)  NULL,
    [Zpp]                                           NVARCHAR (50) NULL,
    [Rost]                                          FLOAT (53)    NULL,
    [Ves]                                           FLOAT (53)    NULL,
    [SostoyaniePatsienta]                           NVARCHAR (50) NULL,
    [Osanka]                                        NVARCHAR (50) NULL,
    [Konstitutsiya]                                 NVARCHAR (50) NULL,
    [Povedenie]                                     NVARCHAR (50) NULL,
    [Kozha]                                         NVARCHAR (50) NULL,
    [Kozha1]                                        NVARCHAR (50) NULL,
    [Kozha2]                                        NVARCHAR (50) NULL,
    [Kozha3]                                        NVARCHAR (50) NULL,
    [Kozha4]                                        NVARCHAR (50) NULL,
    [VidimieSlizistie]                              NVARCHAR (50) NULL,
    [VidimieSlizistie1]                             NVARCHAR (50) NULL,
    [VidimieSlizistie2]                             NVARCHAR (50) NULL,
    [PzhkRazvita]                                   NVARCHAR (50) NULL,
    [Oteki]                                         NVARCHAR (1)  NULL,
    [PreimushestvennoVOblasti]                      NTEXT         NULL,
    [VOblasti]                                      NTEXT         NULL,
    [VidimieSlizistie3]                             NTEXT         NULL,
    [UchastkiDepigmentatsii]                        NVARCHAR (50) NULL,
    [Rubtsi]                                        NVARCHAR (50) NULL,
    [Podborodochnie]                                NVARCHAR (50) NULL,
    [Podnizhnechelyustnie]                          NVARCHAR (50) NULL,
    [Okoloushnie]                                   NVARCHAR (50) NULL,
    [ZadnieSheynie]                                 NVARCHAR (50) NULL,
    [PerednieSheynie]                               NVARCHAR (50) NULL,
    [Mindalini2]                                    NVARCHAR (35) NULL,
    [Dihanie2]                                      NVARCHAR (80) NULL,
    [DihaniePrimechanie2]                           NTEXT         NULL,
    [Hripi3]                                        INT           NULL,
    [Hripi5]                                        INT           NULL,
    [Chdd]                                          INT           NULL,
    [DihanieCherezNos]                              NVARCHAR (50) NULL,
    [RitmDihaniya]                                  NVARCHAR (50) NULL,
    [Kashel1]                                       NVARCHAR (1)  NULL,
    [Odishka1]                                      NVARCHAR (1)  NULL,
    [PatologicheskieIzmeneniya]                     NVARCHAR (50) NULL,
    [GrudnayaKletka]                                NVARCHAR (50) NULL,
    [PriPalpatsii]                                  NVARCHAR (50) NULL,
    [PriPalpatsii1]                                 NVARCHAR (50) NULL,
    [GolosovoeDrozhanie]                            NVARCHAR (50) NULL,
    [GolosovoeDrozhanie1]                           NVARCHAR (50) NULL,
    [NadVseyPoverhnostyuLegkihSlishen]              NVARCHAR (50) NULL,
    [LegochniyZvuk]                                 NVARCHAR (50) NULL,
    [Mindalini]                                     NVARCHAR (35) NULL,
    [Dihanie]                                       INT           NULL,
    [Hripi]                                         INT           NULL,
    [Hripi1]                                        INT           NULL,
    [DihaniePrimechanie]                            NTEXT         NULL,
    [Zev1]                                          NVARCHAR (33) NULL,
    [DopolnitelnieDannieDihanie]                    NTEXT         NULL,
    [Puls]                                          INT           NULL,
    [Defitsit]                                      INT           NULL,
    [Napryazhenie]                                  NVARCHAR (80) NULL,
    [ToniSerdtsa]                                   NVARCHAR (50) NULL,
    [GranitsiSerdtsa]                               NVARCHAR (50) NULL,
    [VerhushechniyTolchok]                          NVARCHAR (50) NULL,
    [Napolnenie]                                    NVARCHAR (50) NULL,
    [NadSosudami]                                   NVARCHAR (27) NULL,
    [AktsentVtorogoTonaNadAortoy]                   NVARCHAR (50) NULL,
    [NadLegochnoyArteriey]                          NVARCHAR (50) NULL,
    [AdNaPravoyRuke]                                INT           NULL,
    [AdNaPravoyRuke1]                               INT           NULL,
    [Harakteristika]                                NVARCHAR (27) NULL,
    [ShumiSerdtsa]                                  NVARCHAR (33) NULL,
    [AdNaLevoyRuke]                                 INT           NULL,
    [AdNaLevoyRuke1]                                INT           NULL,
    [DopolnitelnieDannieCCC]                        NTEXT         NULL,
    [PoseshenieNaDomu]                              INT           NULL,
    [KompleksniyOsmotr]                             NVARCHAR (1)  NULL,
    [NuzhdaetsyaVStatsionarnomLechenii]             NVARCHAR (1)  NULL,
    [NeobhodimaFlyuorografiya]                      NVARCHAR (1)  NULL,
    [Mindalini1]                                    NVARCHAR (35) NULL,
    [Dihanie1]                                      INT           NULL,
    [Hripi2]                                        INT           NULL,
    [Hripi11]                                       INT           NULL,
    [DihaniePrimechanie1]                           NTEXT         NULL,
    [Zev11]                                         NVARCHAR (33) NULL,
    [DopolnitelnieDannieDihanie1]                   NTEXT         NULL,
    [Puls1]                                         INT           NULL,
    [Defitsit1]                                     INT           NULL,
    [Napryazhenie1]                                 INT           NULL,
    [ToniSerdtsa1]                                  INT           NULL,
    [GranitsiSerdtsa1]                              INT           NULL,
    [VerhushechniyTolchok1]                         INT           NULL,
    [Napolnenie1]                                   INT           NULL,
    [NadSosudami1]                                  NVARCHAR (35) NULL,
    [AktsentVtorogoTonaNadAortoy1]                  INT           NULL,
    [NadLegochnoyArteriey1]                         INT           NULL,
    [AdNaPravoyRuke2]                               INT           NULL,
    [AdNaPravoyRuke11]                              INT           NULL,
    [Harakteristika1]                               NVARCHAR (60) NULL,
    [ShumiSerdtsa1]                                 NVARCHAR (33) NULL,
    [AdNaLevoyRuke2]                                INT           NULL,
    [AdNaLevoyRuke11]                               INT           NULL,
    [DopolnitelnieDannieCCC1]                       NTEXT         NULL,
    [PoseshenieNaDomu1]                             INT           NULL,
    [KompleksniyOsmotr1]                            NVARCHAR (1)  NULL,
    [NuzhdaetsyaVStatsionarnomLechenii1]            NVARCHAR (1)  NULL,
    [NeobhodimaFlyuorografiya1]                     NVARCHAR (1)  NULL,
    [Puls3]                                         INT           NULL,
    [Defitsit3]                                     INT           NULL,
    [Napryazhenie3]                                 INT           NULL,
    [GranitsiSerdtsa3]                              INT           NULL,
    [ToniSerdtsa3]                                  INT           NULL,
    [VerhushechniyTolchok3]                         INT           NULL,
    [Napolnenie3]                                   INT           NULL,
    [NadSosudami3]                                  NVARCHAR (35) NULL,
    [ShumiSerdtsa2]                                 NVARCHAR (50) NULL,
    [AdNaPravoyRuke4]                               INT           NULL,
    [NadLegochnoyArteriey21]                        INT           NULL,
    [AdNaPravoyRuke31]                              INT           NULL,
    [AdNaPravoyRuke121]                             INT           NULL,
    [Harakteristika21]                              NVARCHAR (60) NULL,
    [ShumiSerdtsa21]                                NVARCHAR (33) NULL,
    [AdNaLevoyRuke31]                               INT           NULL,
    [AdNaLevoyRuke121]                              INT           NULL,
    [DopolnitelnieDannieCCC21]                      NTEXT         NULL,
    [PoseshenieNaDomu21]                            INT           NULL,
    [KompleksniyOsmotr21]                           NVARCHAR (1)  NULL,
    [NuzhdaetsyaVStatsionarnomLechenii21]           NVARCHAR (1)  NULL,
    [NeobhodimaFlyuorografiya21]                    NVARCHAR (1)  NULL,
    [AdNaPravoyRuke13]                              INT           NULL,
    [AdNaLevoyRuke4]                                INT           NULL,
    [AdNaLevoyRuke13]                               INT           NULL,
    [Harakteristika3]                               NVARCHAR (60) NULL,
    [DopolnitelnieDannie]                           NTEXT         NULL,
    [Mindalini3]                                    NVARCHAR (35) NULL,
    [Zev13]                                         NVARCHAR (33) NULL,
    [Dihanie3]                                      INT           NULL,
    [DihaniePrimechanie3]                           NTEXT         NULL,
    [Hripi4]                                        INT           NULL,
    [Hripi13]                                       INT           NULL,
    [EditBox7]                                      NVARCHAR (50) NULL,
    [DictCombo52]                                   NVARCHAR (50) NULL,
    [DictCombo62]                                   NVARCHAR (50) NULL,
    [Kashel]                                        NVARCHAR (1)  NULL,
    [Odishka]                                       NVARCHAR (1)  NULL,
    [EditBox8]                                      NVARCHAR (50) NULL,
    [DictCombo72]                                   NVARCHAR (50) NULL,
    [DictCombo82]                                   NVARCHAR (50) NULL,
    [DictCombo92]                                   NVARCHAR (50) NULL,
    [DictCombo102]                                  NVARCHAR (50) NULL,
    [DictCombo112]                                  NVARCHAR (50) NULL,
    [DictCombo21]                                   NVARCHAR (50) NULL,
    [EditBox9]                                      NVARCHAR (50) NULL,
    [DictCombo31]                                   NVARCHAR (50) NULL,
    [DictCombo34]                                   NVARCHAR (50) NULL,
    [EditBox12]                                     NVARCHAR (50) NULL,
    [EditBox13]                                     NVARCHAR (50) NULL,
    [EditBox14]                                     NVARCHAR (50) NULL,
    [EditBox15]                                     NVARCHAR (50) NULL,
    [EditBox16]                                     NVARCHAR (50) NULL,
    [EditBox17]                                     NVARCHAR (50) NULL,
    [EditBox18]                                     NVARCHAR (50) NULL,
    [EditBox19]                                     NVARCHAR (50) NULL,
    [EditBox20]                                     NVARCHAR (50) NULL,
    [EditBox21]                                     NVARCHAR (50) NULL,
    [EditBox22]                                     NVARCHAR (50) NULL,
    [EditBox23]                                     NVARCHAR (50) NULL,
    [EditBox24]                                     NVARCHAR (50) NULL,
    [EditBox25]                                     NVARCHAR (50) NULL,
    [Zhivot]                                        NVARCHAR (50) NULL,
    [Zhivot1]                                       NVARCHAR (50) NULL,
    [Simmetrichen]                                  NVARCHAR (1)  NULL,
    [GrizhevieVipyachivaniya]                       NVARCHAR (1)  NULL,
    [PosleoperatsionnieRubtsi]                      NVARCHAR (1)  NULL,
    [Zhivot2]                                       NVARCHAR (50) NULL,
    [Zhivot3]                                       NVARCHAR (50) NULL,
    [PodkozhnayaVenoznayaSet]                       NVARCHAR (1)  NULL,
    [VidimayaPeristaltikaKishechnika]               NVARCHAR (1)  NULL,
    [Meteorizm]                                     NVARCHAR (1)  NULL,
    [PoverhnostnayaPalpatsiya]                      NVARCHAR (50) NULL,
    [PoverhnostnayaPalpatsiya1]                     NVARCHAR (50) NULL,
    [CheckBox1]                                     NVARCHAR (1)  NULL,
    [GrizhevieVipyachivaniya1]                      NVARCHAR (1)  NULL,
    [PoverhnostnayaPalpatsiya2]                     NVARCHAR (50) NULL,
    [SigmovidnayaKishka]                            NTEXT         NULL,
    [SlepayaKishka]                                 NTEXT         NULL,
    [VoshodyashayaINishodyashayaObodochnayaKishka]  NTEXT         NULL,
    [PoperechnoObodochnayaKishka]                   NTEXT         NULL,
    [Palpiruetsya]                                  NVARCHAR (1)  NULL,
    [IssledovanieSelezenki]                         NVARCHAR (50) NULL,
    [Pechen]                                        NVARCHAR (50) NULL,
    [Mocheispuskanie]                               INT           NULL,
    [OblastPochekVneshne]                           NVARCHAR (50) NULL,
    [OblastPochekVneshne1]                          NVARCHAR (50) NULL,
    [Pochki]                                        NVARCHAR (50) NULL,
    [Pochki1]                                       NVARCHAR (50) NULL,
    [Mocheispuskanie1]                              NVARCHAR (50) NULL,
    [SMPokolachivaniya]                             NVARCHAR (50) NULL,
    [SMPokolachivaniya1]                            NVARCHAR (50) NULL,
    [KodPoMkb10]                                    NVARCHAR (10) NULL,
    [DiagnozPoMkb10]                                NVARCHAR (80) NULL,
    [EditBox1]                                      NVARCHAR (50) NULL,
    [ObemDvizheniyVSustavah1]                       NVARCHAR (50) NULL,
    [ObemDvizheniyVSustavah]                        NVARCHAR (50) NULL,
    [DeformatsiiSustavov]                           NVARCHAR (1)  NULL,
    [DeformatsiiKostey]                             NVARCHAR (1)  NULL,
    [MishtsiRazviti]                                NVARCHAR (50) NULL,
    [PriPalpatsii2]                                 NVARCHAR (50) NULL,
    [PriPalpatsii3]                                 NVARCHAR (50) NULL,
    [PriPalpatsii4]                                 NVARCHAR (50) NULL,
    [NaznachennieIssledovaniya]                     NTEXT         NULL,
    [Rekomendatsii]                                 NTEXT         NULL,
    [Inektsii1]                                     NVARCHAR (1)  NULL,
    [LechenieUStomatologa1]                         NVARCHAR (1)  NULL,
    [Operatsii1]                                    NVARCHAR (1)  NULL,
    [Transfuzii1]                                   NVARCHAR (1)  NULL,
    [BitovieUsloviya]                               NVARCHAR (50) NULL,
    [IstochnikPitevoyVodi]                          NVARCHAR (50) NULL,
    [UpotreblenieSiroyVodi]                         NVARCHAR (50) NULL,
    [LichnayaGigiena]                               NVARCHAR (50) NULL,
    [UpotreblenieNarkotikov]                        NVARCHAR (50) NULL,
    [Aktsent2TonaNadAortoy]                         NVARCHAR (1)  NULL,
    [OtekiMemo]                                     NTEXT         NULL,
    [PriPalpatsii5]                                 NVARCHAR (50) NULL,
    [perkutorno]                                    NVARCHAR (50) NULL,
    [appetit]                                       NVARCHAR (50) NULL,
    [Zhivot5]                                       NVARCHAR (50) NULL,
    [Zhivot6]                                       NVARCHAR (50) NULL,
    [PriPalpatsiiBoleznennost10]                    NVARCHAR (50) NULL,
    [Pechen3]                                       NVARCHAR (50) NULL,
    [PriPalpatsii6]                                 NVARCHAR (50) NULL,
    [PriPalpatsii7]                                 NVARCHAR (50) NULL,
    [PriPalpatsii8]                                 NVARCHAR (50) NULL,
    [Zhalobi2]                                      NTEXT         NULL,
    [Konstitutsiya1]                                NVARCHAR (50) NULL,
    [DocTime]                                       DATETIME      NULL,
    [Soznanie1]                                     NVARCHAR (50) NULL,
    [okraska1]                                      NVARCHAR (50) NULL,
    [kozhnyepokrovy1]                               NVARCHAR (50) NULL,
    [turgor1]                                       NVARCHAR (50) NULL,
    [vlaznost1]                                     NVARCHAR (50) NULL,
    [obshsost]                                      NVARCHAR (50) NULL,
    [развитие]                                      NVARCHAR (50) NULL,
    [sustavy]                                       NVARCHAR (50) NULL,
    [PriPalpatsiisustavy]                           NVARCHAR (50) NULL,
    [ObemDvizheniyVSustavah2]                       NVARCHAR (50) NULL,
    [ObemDvizheniyVSustavah3]                       NVARCHAR (50) NULL,
    [mindaliny]                                     NVARCHAR (50) NULL,
    [mindaliny2]                                    NVARCHAR (50) NULL,
    [zev]                                           NVARCHAR (50) NULL,
    [vydelenieiznosa]                               NVARCHAR (50) NULL,
    [ащкьфпклдуелш]                                 NVARCHAR (50) NULL,
    [uchvakte]                                      NVARCHAR (50) NULL,
    [hripy]                                         NVARCHAR (50) NULL,
    [hripy2]                                        NVARCHAR (50) NULL,
    [palpaciazhelpyzyria]                           NVARCHAR (50) NULL,
    [palpzp2]                                       NVARCHAR (50) NULL,
    [simptomOrtnera]                                NVARCHAR (50) NULL,
    [Yazik3]                                        NVARCHAR (50) NULL,
    [Yazik4]                                        NVARCHAR (50) NULL,
    [VistupaetIzPodreberyaNa1]                      INT           NULL,
    [Kray2]                                         NVARCHAR (50) NULL,
    [Stul1]                                         NVARCHAR (50) NULL,
    [ssb]                                           NVARCHAR (50) NULL,
    [palpaciaselezenki]                             NVARCHAR (50) NULL,
    [palpselezenki2]                                NVARCHAR (50) NULL,
    [simptompasternackogo]                          NVARCHAR (50) NULL,
    [Mocheispuskanie4]                              NVARCHAR (50) NULL,
    [zakl]                                          NTEXT         NULL,
    CONSTRAINT [OsmotrTerapevtaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrTerapevtaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

