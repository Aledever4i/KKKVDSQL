﻿CREATE TABLE [dbo].[OsmotrDermatologa] (
    [ID]                                         INT           NOT NULL,
    [PatID]                                      INT           NULL,
    [Boleznennost2]                              NVARCHAR (1)  NULL,
    [ChuvstvoPolzanyaMurashek]                   NVARCHAR (1)  NULL,
    [Zud]                                        NVARCHAR (1)  NULL,
    [Zhzhenie]                                   NVARCHAR (1)  NULL,
    [Suhost]                                     NVARCHAR (1)  NULL,
    [UsilennoeSalootdelenie]                     NVARCHAR (1)  NULL,
    [Potlivost1]                                 NVARCHAR (1)  NULL,
    [IzmenenieTsveta1]                           NVARCHAR (1)  NULL,
    [Sip1]                                       NVARCHAR (1)  NULL,
    [RostVolosNaNetipichnihMestah1]              NVARCHAR (1)  NULL,
    [EditBox2]                                   NVARCHAR (50) NULL,
    [Slabiy1]                                    NVARCHAR (1)  NULL,
    [Intensivniy1]                               NVARCHAR (1)  NULL,
    [Iznuryayushiy1]                             NVARCHAR (1)  NULL,
    [Postoyanniy1]                               NVARCHAR (1)  NULL,
    [Sezonniy1]                                  NVARCHAR (1)  NULL,
    [Combo11]                                    NVARCHAR (50) NULL,
    [ZavisyashiyOVremeniSutok1]                  NVARCHAR (1)  NULL,
    [Combo12]                                    NVARCHAR (50) NULL,
    [Combo3]                                     NVARCHAR (50) NULL,
    [Combo4]                                     NVARCHAR (50) NULL,
    [Combo5]                                     NVARCHAR (50) NULL,
    [Combo6]                                     NVARCHAR (50) NULL,
    [RasseyaniyHarakter1]                        NVARCHAR (1)  NULL,
    [Sgruppirovana1]                             NVARCHAR (1)  NULL,
    [Anulyarnaya1]                               NVARCHAR (1)  NULL,
    [PoHoduNerva1]                               NVARCHAR (1)  NULL,
    [PoHoduReber1]                               NVARCHAR (1)  NULL,
    [Opoyasivayushaya1]                          NVARCHAR (1)  NULL,
    [NaGladkoyKozhe1]                            NVARCHAR (1)  NULL,
    [NaSlizistoy1]                               NVARCHAR (1)  NULL,
    [NaGranitseKozhiISlizistoy1]                 NVARCHAR (1)  NULL,
    [NaVolosistoyChastiGolovi1]                  NVARCHAR (1)  NULL,
    [ZanimaetOpredelennuyuChastTela1]            NVARCHAR (1)  NULL,
    [Opoyasivayushaya]                           NVARCHAR (1)  NULL,
    [NaGladkoyKozhe]                             NVARCHAR (1)  NULL,
    [NaSlizistoy]                                NVARCHAR (1)  NULL,
    [NaGranitseKozhiISlizistoy]                  NVARCHAR (1)  NULL,
    [NaVolosistoyChastiGolovi]                   NVARCHAR (1)  NULL,
    [ZanimaetOpredelennuyuChastTela]             NVARCHAR (1)  NULL,
    [Grud]                                       NVARCHAR (1)  NULL,
    [Zhivot]                                     NVARCHAR (1)  NULL,
    [Genitalii]                                  NVARCHAR (1)  NULL,
    [Lobok]                                      NVARCHAR (1)  NULL,
    [Spina]                                      NVARCHAR (1)  NULL,
    [Poyasnitsa]                                 NVARCHAR (1)  NULL,
    [Yagoditsi]                                  NVARCHAR (1)  NULL,
    [Anus]                                       NVARCHAR (1)  NULL,
    [Predpleche]                                 NVARCHAR (1)  NULL,
    [Zapyaste]                                   NVARCHAR (1)  NULL,
    [Kist]                                       NVARCHAR (1)  NULL,
    [TilKisti]                                   NVARCHAR (1)  NULL,
    [Ladon]                                      NVARCHAR (1)  NULL,
    [Paltsi]                                     NVARCHAR (1)  NULL,
    [Nogti]                                      NVARCHAR (1)  NULL,
    [Plecho1]                                    NVARCHAR (1)  NULL,
    [Bedro]                                      NVARCHAR (1)  NULL,
    [Golen]                                      NVARCHAR (1)  NULL,
    [Stopa]                                      NVARCHAR (1)  NULL,
    [TilStopi]                                   NVARCHAR (1)  NULL,
    [Podoshva]                                   NVARCHAR (1)  NULL,
    [Lob]                                        NVARCHAR (1)  NULL,
    [Golenostop]                                 NVARCHAR (1)  NULL,
    [PohovayaSkladka]                            NVARCHAR (1)  NULL,
    [Uho]                                        NVARCHAR (1)  NULL,
    [Glaza]                                      NVARCHAR (1)  NULL,
    [VerhneeVeko]                                NVARCHAR (1)  NULL,
    [NizhneeVeko]                                NVARCHAR (1)  NULL,
    [Perenositsa]                                NVARCHAR (1)  NULL,
    [Nos]                                        NVARCHAR (1)  NULL,
    [KriloNosa]                                  NVARCHAR (1)  NULL,
    [Skula]                                      NVARCHAR (1)  NULL,
    [Sheka]                                      NVARCHAR (1)  NULL,
    [NosogubnayaOblast]                          NVARCHAR (1)  NULL,
    [VerhnyayaGuba]                              NVARCHAR (1)  NULL,
    [NizhnyayaGuba]                              NVARCHAR (1)  NULL,
    [Podborodok]                                 NVARCHAR (1)  NULL,
    [VerhnyayaKonechnost]                        NVARCHAR (1)  NULL,
    [PodmishechnayaSkladka]                      NVARCHAR (1)  NULL,
    [Plecho]                                     NVARCHAR (1)  NULL,
    [Paltsi1]                                    NVARCHAR (1)  NULL,
    [Nogti1]                                     NVARCHAR (1)  NULL,
    [Sheya]                                      NVARCHAR (1)  NULL,
    [Visok]                                      NVARCHAR (1)  NULL,
    [LitsevayaChast]                             NVARCHAR (1)  NULL,
    [Memo1]                                      NTEXT         NULL,
    [Gipergidroz]                                NVARCHAR (1)  NULL,
    [Combo7]                                     NVARCHAR (50) NULL,
    [Golova]                                     NVARCHAR (1)  NULL,
    [Zatilok]                                    NVARCHAR (1)  NULL,
    [VolosistayaChast]                           NVARCHAR (1)  NULL,
    [Temya]                                      NVARCHAR (1)  NULL,
    [Combo8]                                     NVARCHAR (50) NULL,
    [Istonchen1]                                 NVARCHAR (1)  NULL,
    [Utolshen1]                                  NVARCHAR (1)  NULL,
    [Poristiy1]                                  NVARCHAR (1)  NULL,
    [Rihliy1]                                    NVARCHAR (1)  NULL,
    [Kroshkoobrazniy1]                           NVARCHAR (1)  NULL,
    [Sloistiy1]                                  NVARCHAR (1)  NULL,
    [NalichiePoperechnihPolos1]                  NVARCHAR (1)  NULL,
    [NalichieProdolnihPolos1]                    NVARCHAR (1)  NULL,
    [Vrosshiy1]                                  NVARCHAR (1)  NULL,
    [Tochechnie1]                                NVARCHAR (1)  NULL,
    [Combo13]                                    NVARCHAR (50) NULL,
    [ChastichnoeVipadenie1]                      NVARCHAR (1)  NULL,
    [Diffuznoe1]                                 NVARCHAR (1)  NULL,
    [Ochagami1]                                  NVARCHAR (1)  NULL,
    [PolnoeVipadenieVolosNaGolove1]              NVARCHAR (1)  NULL,
    [OtsutstvieVolosNaDrugihHarakternihMestah1]  NVARCHAR (1)  NULL,
    [Combo14]                                    NVARCHAR (50) NULL,
    [IstonchenieVolosa1]                         NVARCHAR (1)  NULL,
    [UtolshenieVolosa1]                          NVARCHAR (1)  NULL,
    [ObsechenieNaUrovne12Mm1]                    NVARCHAR (1)  NULL,
    [ObsechenieNaUrovne25Mm1]                    NVARCHAR (1)  NULL,
    [ObsechenieNaKontseVolosa1]                  NVARCHAR (1)  NULL,
    [PolnayaPoteryaPigmenta1]                    NVARCHAR (1)  NULL,
    [ChastichnayaOchagovayaPoteryaPigmenta1]     NVARCHAR (1)  NULL,
    [ChastichnayaDiffuznayaPoteryaPigmenta1]     NVARCHAR (1)  NULL,
    [IzmenenieTsvetaVolos1]                      NVARCHAR (1)  NULL,
    [EditBox3]                                   NVARCHAR (50) NULL,
    [Memo2]                                      NTEXT         NULL,
    [Uvelichenie]                                NVARCHAR (1)  NULL,
    [Spayannost]                                 NVARCHAR (1)  NULL,
    [CheckBox1]                                  NVARCHAR (1)  NULL,
    [IzmenenieTsvetaKozhiNadLimfoticheskimUzlom] NVARCHAR (1)  NULL,
    [SoputstvuyushiyLimfongiit]                  NVARCHAR (1)  NULL,
    [VseGruppiLimfouzlov]                        NVARCHAR (1)  NULL,
    [RegionarnieLimfouzli]                       NVARCHAR (1)  NULL,
    [Podchelyustnie]                             NVARCHAR (1)  NULL,
    [Sheynie]                                    NVARCHAR (1)  NULL,
    [Nadklyuchichnie]                            NVARCHAR (1)  NULL,
    [Podmishechnie]                              NVARCHAR (1)  NULL,
    [Pahovie]                                    NVARCHAR (1)  NULL,
    [Memo3]                                      NTEXT         NULL,
    [DictCombo1]                                 NVARCHAR (50) NULL,
    [DictCombo2]                                 NVARCHAR (50) NULL,
    [DictCombo3]                                 NVARCHAR (50) NULL,
    [DictCombo4]                                 NVARCHAR (50) NULL,
    [DictCombo5]                                 NVARCHAR (50) NULL,
    [EditBox1]                                   NVARCHAR (50) NULL,
    [DictCombo6]                                 NVARCHAR (50) NULL,
    [DictCombo7]                                 NVARCHAR (50) NULL,
    [DictCombo8]                                 NVARCHAR (50) NULL,
    [DictCombo9]                                 NVARCHAR (50) NULL,
    [DictCombo10]                                NVARCHAR (50) NULL,
    [DictCombo12]                                NVARCHAR (50) NULL,
    [DictCombo13]                                NVARCHAR (50) NULL,
    [DictCombo14]                                NVARCHAR (50) NULL,
    [DictCombo15]                                NVARCHAR (50) NULL,
    [DictCombo16]                                NVARCHAR (50) NULL,
    [DictCombo17]                                NVARCHAR (50) NULL,
    [DictCombo18]                                NVARCHAR (50) NULL,
    [DictCombo19]                                NVARCHAR (50) NULL,
    [DictCombo11]                                NVARCHAR (50) NULL,
    [Memo4]                                      NTEXT         NULL,
    CONSTRAINT [OsmotrDermatologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrDermatologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

