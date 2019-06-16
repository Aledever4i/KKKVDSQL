﻿CREATE TABLE [dbo].[ListokNetrudosposobnosti] (
    [ID]                                                 INT            NOT NULL,
    [PatID]                                              INT            NULL,
    [Pervichniy]                                         NVARCHAR (1)   NULL,
    [ProdolzhenieListka]                                 NVARCHAR (1)   NULL,
    [Nomerlistka1]                                       NVARCHAR (10)  NULL,
    [Seriyalistka1]                                      NVARCHAR (10)  NULL,
    [OrgNameOrgAddress]                                  NVARCHAR (150) NULL,
    [DateBox1]                                           DATETIME       NULL,
    [PatFullName]                                        NVARCHAR (62)  NULL,
    [PatAge]                                             INT            NULL,
    [MestoRaboti]                                        NVARCHAR (150) NULL,
    [DiagDictCombo]                                      NVARCHAR (50)  NULL,
    [DiagCode]                                           NVARCHAR (5)   NULL,
    [DiagDictCombo1]                                     NVARCHAR (50)  NULL,
    [VidNetrudosposobnosti]                              NVARCHAR (61)  NULL,
    [PrimechanieVidNetrudosposobnosti]                   NVARCHAR (150) NULL,
    [Rejim]                                              NVARCHAR (50)  NULL,
    [OtmetkaoNarusheniiRejima]                           NVARCHAR (50)  NULL,
    [DateBox2]                                           DATETIME       NULL,
    [DateBox3]                                           DATETIME       NULL,
    [DateBox4]                                           DATETIME       NULL,
    [DateBox5]                                           DATETIME       NULL,
    [DateBox6]                                           DATETIME       NULL,
    [DateBox7]                                           DATETIME       NULL,
    [DateBox8]                                           DATETIME       NULL,
    [DateBox9]                                           DATETIME       NULL,
    [DateBox10]                                          DATETIME       NULL,
    [DateBox11]                                          DATETIME       NULL,
    [DateBox12]                                          DATETIME       NULL,
    [DateBox13]                                          DATETIME       NULL,
    [ViborVracha]                                        NVARCHAR (50)  NULL,
    [Podpisvracha1]                                      NVARCHAR (25)  NULL,
    [DateBox14]                                          DATETIME       NULL,
    [DateBox15]                                          DATETIME       NULL,
    [ViborVracha2]                                       NVARCHAR (50)  NULL,
    [Podpisvracha2]                                      NVARCHAR (25)  NULL,
    [DateBox16]                                          DATETIME       NULL,
    [DateBox17]                                          DATETIME       NULL,
    [ViborVracha3]                                       NVARCHAR (50)  NULL,
    [Podpisvracha3]                                      NVARCHAR (25)  NULL,
    [DateBox18]                                          DATETIME       NULL,
    [VidanNoviyListok]                                   NVARCHAR (1)   NULL,
    [(pervichniy)]                                       NVARCHAR (1)   NULL,
    [NomerListka2]                                       NVARCHAR (10)  NULL,
    [ViborVracha4]                                       NVARCHAR (50)  NULL,
    [Podpisvracha4]                                      NVARCHAR (25)  NULL,
    [DiagCode1]                                          NVARCHAR (5)   NULL,
    [EditBox1]                                           NVARCHAR (50)  NULL,
    [EditBox2]                                           NVARCHAR (50)  NULL,
    [DateBox19]                                          DATETIME       NULL,
    [DateBox20]                                          DATETIME       NULL,
    [ViborVracha5]                                       NVARCHAR (50)  NULL,
    [Osnovnoe]                                           NVARCHAR (50)  NULL,
    [ListokPoOsnovnomuMR]                                NVARCHAR (10)  NULL,
    [KodNetrud]                                          NVARCHAR (50)  NULL,
    [Combo1]                                             NVARCHAR (50)  NULL,
    [KodIzmNetrud]                                       INT            NULL,
    [Sostoit]                                            NVARCHAR (1)   NULL,
    [nomer]                                              INT            NULL,
    [Ogrn]                                               INT            NULL,
    [Date1]                                              DATETIME       NULL,
    [Date2]                                              DATETIME       NULL,
    [NomtrPutevki]                                       INT            NULL,
    [OGRNSanatoria]                                      INT            NULL,
    [vozrast1]                                           INT            NULL,
    [vozrast2]                                           INT            NULL,
    [mesaczev1]                                          INT            NULL,
    [mesaczev2]                                          INT            NULL,
    [RodstvennaiSvaz1]                                   NVARCHAR (50)  NULL,
    [RodstvennaiSvaz2]                                   NVARCHAR (50)  NULL,
    [FioSemi1]                                           NVARCHAR (50)  NULL,
    [FioSemi2]                                           NVARCHAR (50)  NULL,
    [PostanovkaNaUchetVRannieSrokiBeremennostiDo12Nedel] NVARCHAR (1)   NULL,
    [UstanovlenaIzmenenaGruppaInvalidnosti]              NVARCHAR (1)   NULL,
    [Inoe]                                               INT            NULL,
    [Patsex]                                             NVARCHAR (50)  NULL,
    [Dolzhnost1]                                         NVARCHAR (50)  NULL,
    [Dolzhnost2]                                         NVARCHAR (50)  NULL,
    [Dolzhnost3]                                         NVARCHAR (50)  NULL,
    [Dolzhnost4]                                         NVARCHAR (50)  NULL,
    [OrgAddress]                                         NVARCHAR (50)  NULL,
    [PatLastName]                                        NVARCHAR (50)  NULL,
    [PatFirstName]                                       NVARCHAR (50)  NULL,
    [PatSecondName]                                      NVARCHAR (50)  NULL,
    [PatBirthDate]                                       DATETIME       NULL,
    [Dublicat]                                           NVARCHAR (1)   NULL,
    CONSTRAINT [ListokNetrudosposobnostiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ListokNetrudosposobnostiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

