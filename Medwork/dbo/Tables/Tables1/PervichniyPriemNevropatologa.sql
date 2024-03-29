﻿CREATE TABLE [dbo].[PervichniyPriemNevropatologa] (
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
    [RefleksiSVerhniyKonechnostey1]                 NVARCHAR (45) NULL,
    [SMKerniga]                                     NVARCHAR (1)  NULL,
    [SMBrudzinskogo]                                NVARCHAR (1)  NULL,
    [RegidnostZatilochnihMisc]                      NVARCHAR (1)  NULL,
    [Litso]                                         INT           NULL,
    [Nistagm]                                       NVARCHAR (1)  NULL,
    [ShumVUshah]                                    NVARCHAR (1)  NULL,
    [SnijenieSluha]                                 NVARCHAR (1)  NULL,
    [D1]                                            NVARCHAR (1)  NULL,
    [D2]                                            NVARCHAR (1)  NULL,
    [D3]                                            NVARCHAR (1)  NULL,
    [C1]                                            NVARCHAR (1)  NULL,
    [C2]                                            NVARCHAR (1)  NULL,
    [C3]                                            NVARCHAR (1)  NULL,
    [C]                                             NVARCHAR (1)  NULL,
    [D]                                             NVARCHAR (1)  NULL,
    [Parez]                                         INT           NULL,
    [Golovokrujenie]                                NVARCHAR (1)  NULL,
    [Golovokrujenie1]                               INT           NULL,
    [Golos]                                         INT           NULL,
    [Glotanie]                                      INT           NULL,
    [Yazik]                                         NVARCHAR (50) NULL,
    [DvizhenieGlaznihYablok]                        INT           NULL,
    [Zrachki]                                       INT           NULL,
    [Soznanie]                                      NVARCHAR (50) NULL,
    [AdSist]                                        INT           NULL,
    [AdDiast]                                       INT           NULL,
    [Puls]                                          INT           NULL,
    [Diplopiya]                                     NVARCHAR (1)  NULL,
    [VPozeRomberga]                                 INT           NULL,
    [Ataksia1]                                      NVARCHAR (20) NULL,
    [Afaziya]                                       INT           NULL,
    [Apraksia]                                      NVARCHAR (1)  NULL,
    [Asteriognoz]                                   NVARCHAR (1)  NULL,
    [Asteriognoz1]                                  NVARCHAR (20) NULL,
    [Paraplegia1]                                   NVARCHAR (20) NULL,
    [Paraplegia]                                    NVARCHAR (1)  NULL,
    [Gemiplegia1]                                   NVARCHAR (20) NULL,
    [Gemiplegia]                                    NVARCHAR (1)  NULL,
    [RasstroystvaDvizheniy]                         INT           NULL,
    [Tetraplegia]                                   NVARCHAR (1)  NULL,
    [Tetraplegia1]                                  NVARCHAR (20) NULL,
    [Monoplegia]                                    NVARCHAR (1)  NULL,
    [Monoplegia1]                                   NVARCHAR (20) NULL,
    [Paraparez1]                                    NVARCHAR (20) NULL,
    [Paraparez]                                     NVARCHAR (1)  NULL,
    [Gemiparez1]                                    NVARCHAR (20) NULL,
    [Gemiparez]                                     NVARCHAR (1)  NULL,
    [Tetraparez1]                                   NVARCHAR (20) NULL,
    [Tetraparez]                                    NVARCHAR (1)  NULL,
    [Monoparez]                                     NVARCHAR (1)  NULL,
    [Monoparez1]                                    NVARCHAR (20) NULL,
    [Dermografizm1]                                 INT           NULL,
    [Dermografizm]                                  INT           NULL,
    [GiperhydrozLadoney]                            NVARCHAR (1)  NULL,
    [EmocionalnoLabilen]                            NVARCHAR (1)  NULL,
    [SimptomLassega]                                NVARCHAR (1)  NULL,
    [SimptomNeri]                                   NVARCHAR (1)  NULL,
    [Zagrujennost]                                  NVARCHAR (1)  NULL,
    [GiperHydrozStop]                               NVARCHAR (1)  NULL,
    [Bistroischezaushiy]                            NVARCHAR (1)  NULL,
    [Adinamia]                                      NVARCHAR (1)  NULL,
    [Vialost]                                       NVARCHAR (1)  NULL,
    [SimptomPosadki]                                NVARCHAR (1)  NULL,
    [ObemDvizheniyPozvonochnika]                    INT           NULL,
    [SostoyanieMishtsSpini]                         NVARCHAR (20) NULL,
    [SkulovoyBehtereva]                             NVARCHAR (1)  NULL,
    [Vyalost]                                       NVARCHAR (1)  NULL,
    [Apatiya]                                       NVARCHAR (1)  NULL,
    [Depressiya]                                    NVARCHAR (1)  NULL,
    [Eyforiya]                                      NVARCHAR (1)  NULL,
    [Kosoglazie]                                    NVARCHAR (1)  NULL,
    [Ptoz]                                          NVARCHAR (1)  NULL,
    [Ekzoftalm]                                     NVARCHAR (1)  NULL,
    [Anizokoriya]                                   NVARCHAR (1)  NULL,
    [ShodyasheesyaKosoglazie]                       NVARCHAR (1)  NULL,
    [Diplopiya1]                                    NVARCHAR (1)  NULL,
    [ShodyasheesyaKosoglazie1]                      NVARCHAR (1)  NULL,
    [Diplopiya2]                                    NVARCHAR (1)  NULL,
    [Lagoftalm]                                     NVARCHAR (1)  NULL,
    [RefleksiSVerhniyKonechnostey2]                 NVARCHAR (35) NULL,
    [GolovnayaBol]                                  NVARCHAR (1)  NULL,
    [Toshnota]                                      NVARCHAR (1)  NULL,
    [Golovokruzhenie]                               NVARCHAR (1)  NULL,
    [Bradikardiya]                                  NVARCHAR (1)  NULL,
    [Atrofichen]                                    NVARCHAR (1)  NULL,
    [Dizartriya]                                    NVARCHAR (1)  NULL,
    [Yazik1]                                        INT           NULL,
    [Chuvstvitelnost1]                              INT           NULL,
    [PromahivaniePriPalcenosovoyProbe1]             NVARCHAR (1)  NULL,
    [Ataksia2]                                      NVARCHAR (1)  NULL,
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
    [FotoreaktsiyaNaSvet1]                          INT           NULL,
    [Vnimanie]                                      NVARCHAR (50) NULL,
    [Pamyat]                                        NVARCHAR (50) NULL,
    [Povedenie]                                     NVARCHAR (50) NULL,
    [IPara]                                         NVARCHAR (50) NULL,
    [PolyaZreniya]                                  NVARCHAR (50) NULL,
    [Tsvetooshushenie]                              NVARCHAR (50) NULL,
    [OS]                                            NVARCHAR (50) NULL,
    [OD]                                            NVARCHAR (50) NULL,
    [FotoreaktsiyaNaSvet]                           NVARCHAR (50) NULL,
    [Konvergentsiya]                                NVARCHAR (50) NULL,
    [Akkomodatsiya]                                 NVARCHAR (50) NULL,
    [DvizheniyaGlaznihYablok]                       NVARCHAR (50) NULL,
    [ProbaRinne]                                    NVARCHAR (50) NULL,
    [ProbaVebera]                                   NVARCHAR (50) NULL,
    [OstrotaSluha]                                  NVARCHAR (50) NULL,
    [NBnieZanaveskiIYazichok]                       NVARCHAR (50) NULL,
    [GlotochniyRefleks]                             NVARCHAR (50) NULL,
    [NBniyRefleks]                                  NVARCHAR (50) NULL,
    [PovorotiGoloviIShei]                           NVARCHAR (50) NULL,
    [DvizheniyaPlech]                               NVARCHAR (50) NULL,
    [Data]                                          DATETIME      NULL,
    [Vrach]                                         NVARCHAR (50) NULL,
    [Zaklyuchenie]                                  NVARCHAR (50) NULL,
    [Kommentrariy]                                  NTEXT         NULL,
    CONSTRAINT [PervichniyPriemNevropatologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PervichniyPriemNevropatologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

