﻿CREATE TABLE [dbo].[OsmotrNevropatologa] (
    [ID]                                   INT           NOT NULL,
    [PatID]                                INT           NULL,
    [DiagnozOsnovnoy]                      NTEXT         NULL,
    [PerenesNnieZabolevaniya]              NTEXT         NULL,
    [DiagnozSoputstvuyushiy]               NTEXT         NULL,
    [AllergicheskieReaktsii]               NTEXT         NULL,
    [VredniePrivichki]                     NTEXT         NULL,
    [Zhalobi]                              NTEXT         NULL,
    [AnamnezZabolevaniya]                  NTEXT         NULL,
    [RigidnostZatilochnihMishts]           NVARCHAR (1)  NULL,
    [SMKerniga]                            NVARCHAR (1)  NULL,
    [SMBrudzinskogo]                       NVARCHAR (1)  NULL,
    [SkulovoyBehtereva]                    NVARCHAR (1)  NULL,
    [Soznanie]                             NVARCHAR (50) NULL,
    [Vnimanie]                             NVARCHAR (50) NULL,
    [Pamyat]                               NVARCHAR (50) NULL,
    [Povedenie]                            NVARCHAR (50) NULL,
    [Vyalost]                              NVARCHAR (1)  NULL,
    [Apatiya]                              NVARCHAR (1)  NULL,
    [Eyforiya]                             NVARCHAR (1)  NULL,
    [Toshnota]                             NVARCHAR (1)  NULL,
    [Bradikordiya]                         NVARCHAR (1)  NULL,
    [GolovnayaBol]                         NVARCHAR (1)  NULL,
    [Golovokruzhenie]                      NVARCHAR (1)  NULL,
    [Depressiya]                           NVARCHAR (1)  NULL,
    [AdSist]                               NVARCHAR (50) NULL,
    [AdDiast]                              NVARCHAR (50) NULL,
    [Puls]                                 NVARCHAR (50) NULL,
    [IPara]                                NVARCHAR (50) NULL,
    [PolyaZreniya]                         NVARCHAR (50) NULL,
    [Tsvetooshusheniya]                    NVARCHAR (50) NULL,
    [OS]                                   NVARCHAR (50) NULL,
    [OD]                                   NVARCHAR (50) NULL,
    [Kosoglazie]                           NVARCHAR (1)  NULL,
    [Anizokoriya]                          NVARCHAR (1)  NULL,
    [Ekzoftalm]                            NVARCHAR (1)  NULL,
    [Diplopiya]                            NVARCHAR (1)  NULL,
    [Ptoz]                                 NVARCHAR (1)  NULL,
    [Zrachki]                              NVARCHAR (50) NULL,
    [Konvergentsiya]                       NVARCHAR (50) NULL,
    [Akkomodatsiya]                        NVARCHAR (50) NULL,
    [FotoreaktsiyaNaSvet]                  NVARCHAR (50) NULL,
    [ShodyashieKosoglazie]                 NVARCHAR (1)  NULL,
    [DiplopiyaDvizheniyaGlaznihYablok]     NVARCHAR (1)  NULL,
    [DiplopiyaDvizheniyaGlaznihYablok1]    NVARCHAR (50) NULL,
    [ShodyashieKosoglazie1]                NVARCHAR (1)  NULL,
    [DiplopiyaDvizheniyaGlaznihYablok2]    NVARCHAR (1)  NULL,
    [DiplopiyaDvizheniyaGlaznihYablok11]   NVARCHAR (50) NULL,
    [D1]                                   NVARCHAR (1)  NULL,
    [D2]                                   NVARCHAR (1)  NULL,
    [D3]                                   NVARCHAR (1)  NULL,
    [S2]                                   NVARCHAR (1)  NULL,
    [S3]                                   NVARCHAR (1)  NULL,
    [S1]                                   NVARCHAR (1)  NULL,
    [Litso]                                NVARCHAR (50) NULL,
    [Parez]                                NVARCHAR (50) NULL,
    [S]                                    NVARCHAR (1)  NULL,
    [D]                                    NVARCHAR (1)  NULL,
    [Lagoftalm]                            NVARCHAR (1)  NULL,
    [Nistagm]                              NVARCHAR (1)  NULL,
    [SnizhenieSluha]                       NVARCHAR (1)  NULL,
    [ProbaRinne]                           NVARCHAR (50) NULL,
    [ProbaVebera]                          NVARCHAR (50) NULL,
    [VPozeRomberga]                        NVARCHAR (50) NULL,
    [OstrotaSluha]                         NVARCHAR (50) NULL,
    [ShumVUshah]                           NVARCHAR (1)  NULL,
    [Golovokruzhenie2]                     NVARCHAR (1)  NULL,
    [Golovokruzhenie3]                     NVARCHAR (50) NULL,
    [NBnieZanaveskiIYazichok]              NVARCHAR (50) NULL,
    [Yazik]                                NVARCHAR (50) NULL,
    [Atrofichen]                           NVARCHAR (1)  NULL,
    [Dizartiya]                            NVARCHAR (1)  NULL,
    [Glotanie]                             NVARCHAR (50) NULL,
    [Golos]                                NVARCHAR (50) NULL,
    [GlotochniyRefleks]                    NVARCHAR (50) NULL,
    [NBniyRefleks]                         NVARCHAR (50) NULL,
    [PovorotiGolovi]                       NVARCHAR (50) NULL,
    [DvizheniePlechey]                     NVARCHAR (50) NULL,
    [RefleksiSVerhnihKonechnostey]         NVARCHAR (50) NULL,
    [RefleksiSNizhnihKonechnostey]         NVARCHAR (50) NULL,
    [Ataksiya]                             NVARCHAR (1)  NULL,
    [PromahivaetsyaPriPaltsenosovoyProbe]  NVARCHAR (1)  NULL,
    [Chuvstvitelnost]                      NVARCHAR (50) NULL,
    [Apraksiya]                            NVARCHAR (1)  NULL,
    [Asteriognoz]                          NVARCHAR (1)  NULL,
    [Apraksiya1]                           NVARCHAR (50) NULL,
    [EditBox2]                             NVARCHAR (50) NULL,
    [PromahivaetsyaPriPaltsenosovoyProbe1] NVARCHAR (50) NULL,
    [Afaziya]                              NVARCHAR (50) NULL,
    [RasstroystvoDvizheniya]               NVARCHAR (50) NULL,
    [Gemiplegiya]                          NVARCHAR (1)  NULL,
    [Paraplegiya]                          NVARCHAR (1)  NULL,
    [Tetraplegiya]                         NVARCHAR (1)  NULL,
    [Monoplegiya]                          NVARCHAR (1)  NULL,
    [Gemiparez]                            NVARCHAR (1)  NULL,
    [Paraparez]                            NVARCHAR (1)  NULL,
    [Tetraparez]                           NVARCHAR (1)  NULL,
    [Monoparez]                            NVARCHAR (1)  NULL,
    [Gemiplegiya1]                         NVARCHAR (50) NULL,
    [Gemiparez1]                           NVARCHAR (50) NULL,
    [Tetraparez1]                          NVARCHAR (50) NULL,
    [Paraplegiya1]                         NVARCHAR (50) NULL,
    [Monoplegiya1]                         NVARCHAR (50) NULL,
    [Paraparez1]                           NVARCHAR (50) NULL,
    [Monoparez1]                           NVARCHAR (50) NULL,
    [Dermografizm]                         NVARCHAR (50) NULL,
    [Bistroischezayushiy1]                 NVARCHAR (50) NULL,
    [Bistroischezayushiy]                  NVARCHAR (1)  NULL,
    [GipergidrolizLadoney]                 NVARCHAR (1)  NULL,
    [GipergidrolizStop]                    NVARCHAR (1)  NULL,
    [EmotsionalnoLabilen]                  NVARCHAR (1)  NULL,
    [Zagruzhennost]                        NVARCHAR (1)  NULL,
    [Vyalost1]                             NVARCHAR (1)  NULL,
    [SimptomLassega]                       NVARCHAR (1)  NULL,
    [SimptomNeri]                          NVARCHAR (1)  NULL,
    [SimptomPosadki]                       NVARCHAR (1)  NULL,
    [SostoyanieMishtsSpini]                NVARCHAR (50) NULL,
    [ObMDvizheniyPozvonochnika]            NVARCHAR (50) NULL,
    [Gemiplegiya2]                         NVARCHAR (50) NULL,
    [Zagruzhennost1]                       NVARCHAR (1)  NULL,
    [Vrach]                                NVARCHAR (50) NULL,
    [Data]                                 DATETIME      NULL,
    [KodPoMkb10]                           NVARCHAR (10) NULL,
    [DiagnozPoMkb10]                       NVARCHAR (80) NULL,
    [Zaklyuchenie]                         NVARCHAR (50) NULL,
    [Kommentrariy]                         NTEXT         NULL,
    [DocTime]                              DATETIME      NULL,
    [AnamnezZhizni]                        NTEXT         NULL,
    [AnamnezZhizni1]                       NTEXT         NULL,
    [AnamnezZhizni2]                       NTEXT         NULL,
    [EpidAnamnes]                          NTEXT         NULL,
    [Operatsii]                            NVARCHAR (1)  NULL,
    [Operatsii2]                           NTEXT         NULL,
    [Transfuzii]                           NVARCHAR (1)  NULL,
    [Transfuzii2]                          NTEXT         NULL,
    [OkruzhnostGolovy]                     FLOAT (53)    NULL,
    [SomaticheskiyStatus]                  NTEXT         NULL,
    [OkruzhnostGrudi]                      FLOAT (53)    NULL,
    [BolRodnichok]                         FLOAT (53)    NULL,
    [NevrologicheskiyStatus]               NTEXT         NULL,
    [IIpara]                               NTEXT         NULL,
    [IIIpara]                              NTEXT         NULL,
    [VIIIpara]                             NTEXT         NULL,
    [IXXXIIpary]                           NTEXT         NULL,
    [XIIpara]                              NTEXT         NULL,
    [VegetativnayaSistema]                 NTEXT         NULL,
    [Poza]                                 NVARCHAR (50) NULL,
    [TonusMyshc]                           NTEXT         NULL,
    [VrozhdennyeRefleksy]                  NTEXT         NULL,
    [ODA]                                  NTEXT         NULL,
    [PlanObsledovaniya]                    NTEXT         NULL,
    [PlanLecheniya]                        NTEXT         NULL,
    [Recomendacii]                         NTEXT         NULL,
    [zakl]                                 NTEXT         NULL,
    CONSTRAINT [OsmotrNevropatologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrNevropatologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

