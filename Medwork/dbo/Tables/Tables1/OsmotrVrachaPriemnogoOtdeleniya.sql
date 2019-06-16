﻿CREATE TABLE [dbo].[OsmotrVrachaPriemnogoOtdeleniya] (
    [ID]                        INT            NOT NULL,
    [PatID]                     INT            NULL,
    [Vrach]                     INT            NULL,
    [zapis]                     NTEXT          NULL,
    [DiagnozPriPostuplenii]     NVARCHAR (255) NULL,
    [obshsost]                  NVARCHAR (50)  NULL,
    [temperatura]               FLOAT (53)     NULL,
    [okraska]                   NVARCHAR (50)  NULL,
    [NoAllergy]                 NVARCHAR (1)   NULL,
    [Allergic2]                 NTEXT          NULL,
    [Allergic4]                 NTEXT          NULL,
    [Allergic]                  NTEXT          NULL,
    [Allergic6]                 NVARCHAR (255) NULL,
    [Allergic1]                 NVARCHAR (255) NULL,
    [Allergic3]                 NVARCHAR (255) NULL,
    [Allergic5]                 NVARCHAR (255) NULL,
    [MKBCode]                   NVARCHAR (50)  NULL,
    [MKBName]                   NVARCHAR (50)  NULL,
    [AnamnezZhizni1]            NTEXT          NULL,
    [AnamnezZhizn]              NVARCHAR (50)  NULL,
    [Data1]                     DATETIME       NULL,
    [DocTime]                   DATETIME       NULL,
    [EpidAnamnes]               NVARCHAR (150) NULL,
    [TelesniePovrezhdeniya]     NTEXT          NULL,
    [visipanya]                 NTEXT          NULL,
    [boleznennoe]               NVARCHAR (50)  NULL,
    [simptompasternackogo]      NVARCHAR (50)  NULL,
    [pitanie]                   NVARCHAR (50)  NULL,
    [Dihanie]                   NVARCHAR (50)  NULL,
    [Zev]                       NTEXT          NULL,
    [Puls]                      INT            NULL,
    [ritm]                      NVARCHAR (50)  NULL,
    [serdechtony]               NVARCHAR (50)  NULL,
    [AD]                        INT            NULL,
    [Yazik]                     NVARCHAR (50)  NULL,
    [Stul]                      NVARCHAR (50)  NULL,
    [patologsymptom]            NVARCHAR (50)  NULL,
    [zrachki]                   NVARCHAR (20)  NULL,
    [zrachki1]                  NVARCHAR (100) NULL,
    [fotoreakciya]              NVARCHAR (50)  NULL,
    [nosogubnayaskladka]        NVARCHAR (50)  NULL,
    [yaziknevrolog]             NVARCHAR (50)  NULL,
    [suhozilnperiostrefleksi]   NVARCHAR (50)  NULL,
    [pozaromberga]              NVARCHAR (50)  NULL,
    [palcenosovayaproba]        NVARCHAR (50)  NULL,
    [patologznaki]              NTEXT          NULL,
    [dopsvedeniya]              NTEXT          NULL,
    [psihstatus]                NTEXT          NULL,
    [obosnovaniegospitalizacii] NVARCHAR (100) NULL,
    [vrachebnprincip]           NTEXT          NULL,
    [Zhalobi]                   NTEXT          NULL,
    [ves]                       INT            NULL,
    [Zhivot]                    NVARCHAR (100) NULL,
    [ParenhimatoznieOrgani]     NVARCHAR (50)  NULL,
    [PsihDopsvedeniya]          NTEXT          NULL,
    [SomatDopsvedeniya]         NTEXT          NULL,
    [AD1]                       INT            NULL,
    [PrimechanieYazik]          NVARCHAR (200) NULL,
    [rost]                      INT            NULL,
    [Oteki]                     NTEXT          NULL,
    CONSTRAINT [OsmotrVrachaPriemnogoOtdeleniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrVrachaPriemnogoOtdeleniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
