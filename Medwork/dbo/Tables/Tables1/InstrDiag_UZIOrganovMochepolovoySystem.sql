﻿CREATE TABLE [dbo].[InstrDiag_UZIOrganovMochepolovoySystem] (
    [ID]                          INT           NOT NULL,
    [PatID]                       INT           NULL,
    [Dihatelnayapodvijnost]       NTEXT         NULL,
    [DihatelnayaPodvijnostL]      NTEXT         NULL,
    [RazmeriPochki]               FLOAT (53)    NULL,
    [RazmeriPochkiL]              FLOAT (53)    NULL,
    [Strukturaparenhimi]          NVARCHAR (50) NULL,
    [StrukturaParenhimiL]         NVARCHAR (50) NULL,
    [Kortmeddifferenc]            NVARCHAR (50) NULL,
    [KortmeddifferencL]           NVARCHAR (50) NULL,
    [Tolshinaparenhi]             FLOAT (53)    NULL,
    [TolshinaParenhiL]            FLOAT (53)    NULL,
    [Konkrementi]                 NVARCHAR (50) NULL,
    [KonkrementiL]                NVARCHAR (50) NULL,
    [Obrazovaniya]                NVARCHAR (50) NULL,
    [ObrazovaniyaL]               NVARCHAR (50) NULL,
    [Perenhima]                   NVARCHAR (50) NULL,
    [PerenhimaL]                  NVARCHAR (50) NULL,
    [Raspolojenie]                NVARCHAR (50) NULL,
    [RaspolojenieL]               NVARCHAR (50) NULL,
    [Konturi]                     NVARCHAR (50) NULL,
    [KonturiL]                    NVARCHAR (50) NULL,
    [Ehogennostperenhimi]         NVARCHAR (50) NULL,
    [EhogennostPerenhimiL]        NVARCHAR (50) NULL,
    [KonkrementiMemo]             NTEXT         NULL,
    [KonkrementiMemoL]            NTEXT         NULL,
    [ObrazovaniyaMemo]            NTEXT         NULL,
    [ObrazovaniyaMemoL]           NTEXT         NULL,
    [CHLSys]                      NTEXT         NULL,
    [CHLSysL]                     NTEXT         NULL,
    [JirTreugVproekNadpoch]       NTEXT         NULL,
    [Napolnen]                    FLOAT (53)    NULL,
    [KonturiMCH]                  NTEXT         NULL,
    [Stena]                       NTEXT         NULL,
    [Soderjimoe]                  NTEXT         NULL,
    [OstatochnayaMocha]           FLOAT (53)    NULL,
    [UstiyaMochetochnikov]        NTEXT         NULL,
    [ProcentOstMoch]              INT           NULL,
    [PassajMochiPoMochetochnikam] NTEXT         NULL,
    [RazmerStenok]                FLOAT (53)    NULL,
    [RazmeriPJ]                   FLOAT (53)    NULL,
    [ObemPJ]                      FLOAT (53)    NULL,
    [FormPJ]                      NTEXT         NULL,
    [KapsulaPJ]                   NTEXT         NULL,
    [StrukturaPJ]                 NTEXT         NULL,
    [EhogennostPJ]                NTEXT         NULL,
    [MejdolevayaBorozda]          NTEXT         NULL,
    [DoliSimetrichni]             NTEXT         NULL,
    [Obrazovanie]                 NVARCHAR (50) NULL,
    [KonturiPJ]                   NTEXT         NULL,
    [StrukturiSemPuz]             NTEXT         NULL,
    [RazmerSprava]                FLOAT (53)    NULL,
    [RazmerSleva]                 FLOAT (53)    NULL,
    [Zakluchenie]                 NTEXT         NULL,
    [obrazmemo]                   NTEXT         NULL,
    [Konturi1]                    NVARCHAR (50) NULL,
    [KonturiL1]                   NVARCHAR (50) NULL,
    [Konturi2]                    NVARCHAR (50) NULL,
    [KonturiL2]                   NVARCHAR (50) NULL,
    CONSTRAINT [InstrDiag_UZIOrganovMochepolovoySystemPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_UZIOrganovMochepolovoySystemToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
