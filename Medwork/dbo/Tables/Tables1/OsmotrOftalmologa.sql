﻿CREATE TABLE [dbo].[OsmotrOftalmologa] (
    [ID]                                            INT            NOT NULL,
    [PatID]                                         INT            NULL,
    [Zhalobi]                                       NTEXT          NULL,
    [AnamnezZhizni]                                 NTEXT          NULL,
    [AnamnezZhizni1]                                NTEXT          NULL,
    [AnamnezZhizni2]                                NTEXT          NULL,
    [AnamnezZhizni3]                                NTEXT          NULL,
    [AnamnezZabolevaniya]                           NTEXT          NULL,
    [Medikamentov]                                  NTEXT          NULL,
    [Produktov]                                     NTEXT          NULL,
    [Memo7]                                         NTEXT          NULL,
    [Inektsii]                                      NVARCHAR (1)   NULL,
    [LechenieUStomatologa]                          NVARCHAR (1)   NULL,
    [Operatsii]                                     NVARCHAR (1)   NULL,
    [Transfuzii]                                    NVARCHAR (1)   NULL,
    [GruppaKrovi]                                   NVARCHAR (50)  NULL,
    [Rh]                                            NVARCHAR (50)  NULL,
    [TransfuziiRanshe]                              NVARCHAR (50)  NULL,
    [BitovieUsloviya]                               NVARCHAR (50)  NULL,
    [LichnayaGigiena]                               NVARCHAR (50)  NULL,
    [UpotreblenieNarkotikov]                        NVARCHAR (50)  NULL,
    [IstochnikPitevoyVodi]                          NVARCHAR (50)  NULL,
    [UpotreblenieSiroyVodi]                         NVARCHAR (50)  NULL,
    [NalichieTbVichMalyariiTifaParatifaGepatitaZpp] NVARCHAR (50)  NULL,
    [Tb]                                            NVARCHAR (1)   NULL,
    [Vich]                                          NVARCHAR (1)   NULL,
    [Malyariya]                                     NVARCHAR (1)   NULL,
    [Tif]                                           NVARCHAR (1)   NULL,
    [Paratif]                                       NVARCHAR (1)   NULL,
    [Gepatit]                                       NVARCHAR (1)   NULL,
    [Zpp]                                           NVARCHAR (50)  NULL,
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
    [SteklovidnoeTelo2]                             NVARCHAR (1)   NULL,
    [SteklovidnoeTelo]                              INT            NULL,
    [SteklovidnoeTelo1]                             NVARCHAR (50)  NULL,
    [GlaznoeDnoVNorme]                              NVARCHAR (1)   NULL,
    [ObektivniyStatus]                              NTEXT          NULL,
    [GlaznoeDno]                                    NVARCHAR (50)  NULL,
    [ZritelniyNerv1]                                NTEXT          NULL,
    [Sosudi1]                                       NTEXT          NULL,
    [Setchatka1]                                    NTEXT          NULL,
    [VnutriglaznoeDavlenie1]                        NTEXT          NULL,
    [ObektivnayaRefraktsiya1]                       NTEXT          NULL,
    [Dopolnitelno]                                  NTEXT          NULL,
    [Data]                                          DATETIME       NULL,
    [Vrach]                                         NVARCHAR (50)  NULL,
    [PredvaritelniyDiagnoz]                         NTEXT          NULL,
    [DateBox1]                                      DATETIME       NULL,
    [DictCombo1]                                    NVARCHAR (50)  NULL,
    [Memo1]                                         NTEXT          NULL,
    [Memo2]                                         NTEXT          NULL,
    [Combo1]                                        NVARCHAR (50)  NULL,
    [EditBox1]                                      NVARCHAR (50)  NULL,
    [EditBox2]                                      NVARCHAR (50)  NULL,
    [Combo2]                                        NVARCHAR (50)  NULL,
    [EditBox3]                                      NVARCHAR (50)  NULL,
    [EditBox4]                                      NVARCHAR (50)  NULL,
    [EditBox5]                                      NVARCHAR (50)  NULL,
    [EditBox6]                                      NVARCHAR (50)  NULL,
    [EditBox7]                                      NVARCHAR (50)  NULL,
    [EditBox8]                                      NVARCHAR (50)  NULL,
    [Combo3]                                        NVARCHAR (50)  NULL,
    [Combo4]                                        NVARCHAR (50)  NULL,
    [EditBox9]                                      NVARCHAR (50)  NULL,
    [EditBox10]                                     NVARCHAR (50)  NULL,
    [Combo5]                                        NVARCHAR (50)  NULL,
    [Combo6]                                        NVARCHAR (50)  NULL,
    [Combo7]                                        NVARCHAR (50)  NULL,
    [Combo8]                                        NVARCHAR (50)  NULL,
    [Combo9]                                        NVARCHAR (50)  NULL,
    [Combo10]                                       NVARCHAR (50)  NULL,
    [Combo11]                                       NVARCHAR (50)  NULL,
    [Combo12]                                       NVARCHAR (50)  NULL,
    [Combo13]                                       NVARCHAR (50)  NULL,
    [Combo14]                                       NVARCHAR (50)  NULL,
    [Combo15]                                       NVARCHAR (50)  NULL,
    [Combo16]                                       NVARCHAR (50)  NULL,
    [Combo17]                                       NVARCHAR (50)  NULL,
    [Combo18]                                       NVARCHAR (50)  NULL,
    [Combo19]                                       NVARCHAR (50)  NULL,
    [EditBox11]                                     NVARCHAR (50)  NULL,
    [Combo20]                                       NVARCHAR (50)  NULL,
    [Combo21]                                       NVARCHAR (50)  NULL,
    [Combo22]                                       NVARCHAR (50)  NULL,
    CONSTRAINT [OsmotrOftalmologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrOftalmologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
