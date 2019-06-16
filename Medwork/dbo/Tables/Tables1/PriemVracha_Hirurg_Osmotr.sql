﻿CREATE TABLE [dbo].[PriemVracha_Hirurg_Osmotr] (
    [ID]                                       INT            NOT NULL,
    [PatID]                                    INT            NULL,
    [ZadnieSheynie]                            NVARCHAR (50)  NULL,
    [PerednieSheynie]                          NVARCHAR (50)  NULL,
    [Okoloushnie]                              NVARCHAR (50)  NULL,
    [Podnizhnechelyustnie]                     NVARCHAR (50)  NULL,
    [Podborodochnie]                           NVARCHAR (50)  NULL,
    [Podborodochnie1]                          NVARCHAR (50)  NULL,
    [PerednieSheynie1]                         NVARCHAR (50)  NULL,
    [ZadnieSheynie1]                           NVARCHAR (50)  NULL,
    [Podnizhnechelyustnie1]                    NVARCHAR (50)  NULL,
    [Okoloushnie1]                             NVARCHAR (50)  NULL,
    [Podborodochnie2]                          NTEXT          NULL,
    [PerednieSheynie2]                         NTEXT          NULL,
    [ZadnieSheynie2]                           NTEXT          NULL,
    [Podnizhnechelyustnie2]                    NTEXT          NULL,
    [Okoloushnie2]                             NTEXT          NULL,
    [VerhnieKonechnosti]                       NTEXT          NULL,
    [FlebektaziyaVOblastiNizhnihKonechnostey1] NVARCHAR (1)   NULL,
    [otekicombo]                               NVARCHAR (50)  NULL,
    [otekicombolocate]                         NVARCHAR (50)  NULL,
    [Otekimemo]                                NTEXT          NULL,
    [Flebektazia]                              NVARCHAR (50)  NULL,
    [Flebektaziamemo]                          NTEXT          NULL,
    [PulsaciyaArteriy]                         NTEXT          NULL,
    [sustavi]                                  NTEXT          NULL,
    [SustaviCombo]                             NVARCHAR (50)  NULL,
    [NizhnieKonechnosti]                       NTEXT          NULL,
    [Yazik]                                    NVARCHAR (50)  NULL,
    [Yazik2]                                   NVARCHAR (50)  NULL,
    [Yazikmemo]                                NVARCHAR (150) NULL,
    [myagkiyZhestkiy]                          NVARCHAR (50)  NULL,
    [Vzdut]                                    NVARCHAR (1)   NULL,
    [Doskoobrazniy]                            NVARCHAR (1)   NULL,
    [BoleznennostZhivot]                       NVARCHAR (50)  NULL,
    [Zhivotmemo]                               NTEXT          NULL,
    [VistupaetIzPodreberyaNa1]                 INT            NULL,
    [Kray2]                                    NVARCHAR (50)  NULL,
    [Boleznennaya]                             NVARCHAR (1)   NULL,
    [PalpiruetsyaUKrayaRebernoyDugi]           NVARCHAR (1)   NULL,
    [Uvelichena]                               NVARCHAR (1)   NULL,
    [BoleznennayaMemo]                         NTEXT          NULL,
    [SimptomCombo]                             NVARCHAR (50)  NULL,
    [SimptomCombo1]                            NVARCHAR (50)  NULL,
    [SimptomCombo2]                            NVARCHAR (50)  NULL,
    [SimptomCombo3]                            NVARCHAR (50)  NULL,
    [SimptomCombo4]                            NVARCHAR (50)  NULL,
    [SimptomCombo5]                            NVARCHAR (50)  NULL,
    [SimptomCombo6]                            NVARCHAR (50)  NULL,
    [SimptomCombo7]                            NVARCHAR (50)  NULL,
    [SimptomCombo8]                            NVARCHAR (50)  NULL,
    [SimptomCombo9]                            NVARCHAR (50)  NULL,
    [SimptomCombo10]                           NVARCHAR (50)  NULL,
    CONSTRAINT [PriemVracha_Hirurg_OsmotrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Hirurg_OsmotrToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

