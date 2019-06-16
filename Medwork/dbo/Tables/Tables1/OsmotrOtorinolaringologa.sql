﻿CREATE TABLE [dbo].[OsmotrOtorinolaringologa] (
    [ID]                                         INT            NOT NULL,
    [PatID]                                      INT            NULL,
    [Data]                                       DATETIME       NULL,
    [AnamnezZabolevaniya]                        NTEXT          NULL,
    [Zhalobi]                                    NTEXT          NULL,
    [Memo1]                                      NTEXT          NULL,
    [Obonyanie1]                                 NVARCHAR (80)  NULL,
    [Obonyanie]                                  NVARCHAR (50)  NULL,
    [NosovoeDihanie]                             NVARCHAR (50)  NULL,
    [UstyaSluhovihTrub1]                         NVARCHAR (50)  NULL,
    [NaruzhniyNos]                               NVARCHAR (50)  NULL,
    [NosovoeDihanie1]                            NVARCHAR (80)  NULL,
    [NaruzhniyNos1]                              NVARCHAR (80)  NULL,
    [PreddverieNosa]                             NVARCHAR (50)  NULL,
    [PreddverieNosa1]                            NVARCHAR (80)  NULL,
    [PreddverieNosa2]                            NVARCHAR (80)  NULL,
    [PeregorodkaNosa]                            NVARCHAR (80)  NULL,
    [SlizistayaObolochka]                        NVARCHAR (80)  NULL,
    [NosovieRakovini]                            NVARCHAR (80)  NULL,
    [Otdelyaemoe]                                NVARCHAR (80)  NULL,
    [NosovieHodi]                                NVARCHAR (80)  NULL,
    [NosoglodkaZadnyayaRinoskopiya]              NVARCHAR (80)  NULL,
    [SvodNosoglodki]                             NVARCHAR (80)  NULL,
    [UstyaSluhovihTrub]                          NVARCHAR (80)  NULL,
    [SlizistayaObolochka3]                       NVARCHAR (80)  NULL,
    [Otdelyaemoe2]                               NVARCHAR (80)  NULL,
    [Vkus]                                       NVARCHAR (50)  NULL,
    [Vkus1]                                      NVARCHAR (80)  NULL,
    [PreddveriePolostiRtaZubi]                   NVARCHAR (50)  NULL,
    [PreddveriePolostiRtaZubi1]                  NVARCHAR (80)  NULL,
    [PolostRtaYazik]                             NVARCHAR (80)  NULL,
    [NebnieMindalini]                            NVARCHAR (80)  NULL,
    [NebnieDuzhki]                               NVARCHAR (80)  NULL,
    [SlizistayaObolochka1]                       NVARCHAR (80)  NULL,
    [ZadnyayaStenkaGlotki]                       NVARCHAR (80)  NULL,
    [Otdelyaemoe1]                               NVARCHAR (80)  NULL,
    [Gortanoglotka]                              NVARCHAR (80)  NULL,
    [Vallekuli]                                  NVARCHAR (80)  NULL,
    [GrushevidnieSinusi]                         NVARCHAR (80)  NULL,
    [Vkus2]                                      NVARCHAR (50)  NULL,
    [Vkus11]                                     NVARCHAR (80)  NULL,
    [PreddveriePolostiRtaZubi2]                  NVARCHAR (50)  NULL,
    [PreddveriePolostiRtaZubi11]                 NVARCHAR (80)  NULL,
    [PolostRtaYazik1]                            NVARCHAR (80)  NULL,
    [NebnieMindalini1]                           NVARCHAR (80)  NULL,
    [NebnieDuzhki1]                              NVARCHAR (80)  NULL,
    [SlizistayaObolochka11]                      NVARCHAR (80)  NULL,
    [Obonyanie21]                                NVARCHAR (50)  NULL,
    [Obonyanie31]                                NVARCHAR (80)  NULL,
    [Obonyanie41]                                NVARCHAR (50)  NULL,
    [Obonyanie51]                                NVARCHAR (80)  NULL,
    [Obonyanie61]                                NVARCHAR (80)  NULL,
    [Obonyanie71]                                NVARCHAR (80)  NULL,
    [Obonyanie81]                                NVARCHAR (80)  NULL,
    [Obonyanie91]                                NVARCHAR (80)  NULL,
    [ZadnyayaStenkaGlotki1]                      NVARCHAR (80)  NULL,
    [Otdelyaemoe11]                              NVARCHAR (80)  NULL,
    [Gortanoglotka1]                             NVARCHAR (80)  NULL,
    [Vallekuli2]                                 NVARCHAR (80)  NULL,
    [Vallekuli11]                                NVARCHAR (80)  NULL,
    [SlizistayaObolochka2]                       NVARCHAR (80)  NULL,
    [Otdelyaemoe3]                               NVARCHAR (80)  NULL,
    [Vkus3]                                      NVARCHAR (50)  NULL,
    [Dihanie]                                    NVARCHAR (80)  NULL,
    [SostoyanieSlizistoyObolochki1]              NVARCHAR (50)  NULL,
    [PodskladochnoeProstranstvo]                 NVARCHAR (50)  NULL,
    [Vkus7]                                      NVARCHAR (50)  NULL,
    [Golos]                                      NVARCHAR (80)  NULL,
    [Vkus8]                                      NVARCHAR (50)  NULL,
    [PreddverieGortani]                          NVARCHAR (80)  NULL,
    [GolosovieSkladki]                           NVARCHAR (80)  NULL,
    [Tsvet]                                      NVARCHAR (80)  NULL,
    [TonusGolosovihSkladok1]                     NVARCHAR (50)  NULL,
    [SmikaniePriFrontatsii]                      NVARCHAR (50)  NULL,
    [SostoyanieSlizistoyObolochki]               NVARCHAR (80)  NULL,
    [SmikaniePriFrontatsii1]                     NVARCHAR (80)  NULL,
    [PodvizhnostPriDihanii2]                     NVARCHAR (50)  NULL,
    [PodvizhnostPriDihanii]                      NVARCHAR (80)  NULL,
    [TonusGolosovihSkladok]                      NVARCHAR (80)  NULL,
    [PodskladochnoeProstranstvo1]                NVARCHAR (80)  NULL,
    [Otdelyaemoe4]                               NVARCHAR (50)  NULL,
    [SlizistayaObolochka4]                       NVARCHAR (50)  NULL,
    [SlizistayaObolochka5]                       NVARCHAR (80)  NULL,
    [Otdelyaemoe5]                               NVARCHAR (80)  NULL,
    [PalpatsiyaPerkussiyaSostsevidnogoOtrostka]  NVARCHAR (80)  NULL,
    [PalpatsiyaKozelka]                          NVARCHAR (80)  NULL,
    [UshnayaRakovina]                            NVARCHAR (50)  NULL,
    [UshnayaRakovina1]                           NVARCHAR (80)  NULL,
    [NaruzhniySluhovoyProhod]                    NVARCHAR (50)  NULL,
    [NaruzhniySluhovoyProhod3]                   NVARCHAR (80)  NULL,
    [Kozha]                                      NVARCHAR (50)  NULL,
    [Kozha2]                                     NVARCHAR (80)  NULL,
    [Otdelyaemoe6]                               NVARCHAR (50)  NULL,
    [Otdelyaemoe7]                               NVARCHAR (80)  NULL,
    [BarabannayaPereponka]                       NVARCHAR (80)  NULL,
    [TsvetVid1]                                  NVARCHAR (50)  NULL,
    [TsvetVid]                                   NVARCHAR (80)  NULL,
    [OpoznavatelnieZnaki]                        NVARCHAR (80)  NULL,
    [Tselostnost]                                NVARCHAR (80)  NULL,
    [Tselostnost1]                               NVARCHAR (80)  NULL,
    [TsvetVid2]                                  NVARCHAR (50)  NULL,
    [OpoznavatelnieZnaki1]                       NVARCHAR (80)  NULL,
    [TsvetVid3]                                  NVARCHAR (80)  NULL,
    [BarabannayaPereponka1]                      NVARCHAR (80)  NULL,
    [Otdelyaemoe8]                               NVARCHAR (50)  NULL,
    [Kozha1]                                     NVARCHAR (50)  NULL,
    [NaruzhniySluhovoyProhod1]                   NVARCHAR (50)  NULL,
    [NaruzhniySluhovoyProhod4]                   NVARCHAR (80)  NULL,
    [Kozha3]                                     NVARCHAR (80)  NULL,
    [Otdelyaemoe9]                               NVARCHAR (80)  NULL,
    [UshnayaRakovina2]                           NVARCHAR (80)  NULL,
    [UshnayaRakovina3]                           NVARCHAR (50)  NULL,
    [PalpatsiyaKozelka1]                         NVARCHAR (80)  NULL,
    [PalpatsiyaPerkussiyaSostsevidnogoOtrostka1] NVARCHAR (80)  NULL,
    [Shum1]                                      NVARCHAR (200) NULL,
    [Shum]                                       NVARCHAR (200) NULL,
    [ShepotnayaRech]                             NVARCHAR (200) NULL,
    [ShepotnayaRech1]                            NVARCHAR (200) NULL,
    [RazgovornayaRech1]                          NVARCHAR (200) NULL,
    [RazgovornayaRech]                           NVARCHAR (200) NULL,
    [GromkayaRech]                               NVARCHAR (200) NULL,
    [GromkayaRech1]                              NVARCHAR (200) NULL,
    [OpitVeberaW1]                               NVARCHAR (50)  NULL,
    [OpitVeberaW]                                NVARCHAR (50)  NULL,
    [OpitRinneR]                                 NVARCHAR (50)  NULL,
    [OpitFedericheF]                             NVARCHAR (50)  NULL,
    [OpitZheleG]                                 NVARCHAR (50)  NULL,
    [OpitZheleG1]                                NVARCHAR (50)  NULL,
    [OpitFedericheF1]                            NVARCHAR (50)  NULL,
    [OpitRinneR1]                                NVARCHAR (50)  NULL,
    [EditBox7]                                   NVARCHAR (50)  NULL,
    [Kostnaya2]                                  NVARCHAR (50)  NULL,
    [Vozdushnaya2]                               NVARCHAR (50)  NULL,
    [Vozdushnaya3]                               NVARCHAR (50)  NULL,
    [Kostnaya1]                                  NVARCHAR (50)  NULL,
    [Vozdushnaya]                                NVARCHAR (50)  NULL,
    [Kostnaya]                                   NVARCHAR (50)  NULL,
    [Vozdushnaya1]                               NVARCHAR (50)  NULL,
    [Golovokruzhenie]                            NVARCHAR (80)  NULL,
    [Toshnota]                                   NVARCHAR (80)  NULL,
    [Rvota]                                      NVARCHAR (80)  NULL,
    [PaltseNosovayaProba]                        NVARCHAR (80)  NULL,
    [PozaRomberga]                               NVARCHAR (80)  NULL,
    [PohodkaPoPryamoy]                           NVARCHAR (80)  NULL,
    [FlangovayaPohodka]                          NVARCHAR (80)  NULL,
    [ProbaNaDiadohokinez]                        NVARCHAR (80)  NULL,
    [PressornayaProba]                           NVARCHAR (80)  NULL,
    [Vrach]                                      NVARCHAR (50)  NULL,
    [KodPoMkb10]                                 NVARCHAR (10)  NULL,
    [DiagnozPoMkb10]                             NVARCHAR (80)  NULL,
    CONSTRAINT [OsmotrOtorinolaringologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrOtorinolaringologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

