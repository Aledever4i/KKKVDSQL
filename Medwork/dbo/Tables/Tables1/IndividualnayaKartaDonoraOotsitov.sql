﻿CREATE TABLE [dbo].[IndividualnayaKartaDonoraOotsitov] (
    [ID]                 INT            NOT NULL,
    [PatID]              INT            NULL,
    [Kuren]              NVARCHAR (50)  NULL,
    [UpotreblAlk]        NVARCHAR (50)  NULL,
    [UpotreblNark]       NVARCHAR (50)  NULL,
    [Ves]                INT            NULL,
    [Rost]               INT            NULL,
    [Volosi]             NVARCHAR (50)  NULL,
    [Cvvolos]            NVARCHAR (50)  NULL,
    [Glaza]              NVARCHAR (50)  NULL,
    [RazrGlaz]           NVARCHAR (50)  NULL,
    [CvGlaz]             NVARCHAR (50)  NULL,
    [Lico]               NVARCHAR (50)  NULL,
    [Nos]                NVARCHAR (50)  NULL,
    [FNosa]              NVARCHAR (50)  NULL,
    [Lob]                NVARCHAR (50)  NULL,
    [Telosl]             NVARCHAR (50)  NULL,
    [RazmOd]             FLOAT (53)     NULL,
    [RazmOb]             FLOAT (53)     NULL,
    [RazmByust]          INT            NULL,
    [NDonor]             NVARCHAR (20)  NULL,
    [DateZapoln]         DATETIME       NULL,
    [FIO]                NVARCHAR (155) NULL,
    [Natsionalnost]      NVARCHAR (50)  NULL,
    [DateRojd]           DATETIME       NULL,
    [PaspDann]           NTEXT          NULL,
    [DomAdr]             NTEXT          NULL,
    [Obraz]              NVARCHAR (50)  NULL,
    [Prof]               NVARCHAR (155) NULL,
    [Profvr]             NVARCHAR (50)  NULL,
    [Kakie]              NVARCHAR (50)  NULL,
    [SemeynoePolozhenie] NVARCHAR (50)  NULL,
    [Nalichiedetey]      NVARCHAR (50)  NULL,
    [VozrPoslreb]        INT            NULL,
    [NaslZabvsem]        NVARCHAR (50)  NULL,
    [KakieNaslZab]       NVARCHAR (50)  NULL,
    [SIF]                NVARCHAR (50)  NULL,
    [Vich]               NVARCHAR (50)  NULL,
    [Netrad]             NVARCHAR (50)  NULL,
    [Disp]               NVARCHAR (50)  NULL,
    [DispUchKak]         NVARCHAR (72)  NULL,
    [GruppaKrovi]        INT            NULL,
    [RezusFaktor]        INT            NULL,
    [DateKO1]            DATETIME       NULL,
    [DateKO2]            DATETIME       NULL,
    [RezKO1]             NVARCHAR (50)  NULL,
    [RezKO2]             NVARCHAR (50)  NULL,
    [DateKO3]            DATETIME       NULL,
    [RezKO3]             NVARCHAR (50)  NULL,
    [DateKO4]            DATETIME       NULL,
    [RezKO4]             NVARCHAR (50)  NULL,
    [DateKO5]            DATETIME       NULL,
    [RezKO5]             NVARCHAR (50)  NULL,
    [DateKO6]            DATETIME       NULL,
    [RezKO6]             NVARCHAR (50)  NULL,
    [DateKO7]            DATETIME       NULL,
    [RezKO7]             NVARCHAR (50)  NULL,
    [DateKO8]            DATETIME       NULL,
    [RezKO8]             NVARCHAR (50)  NULL,
    [DateKO9]            DATETIME       NULL,
    [RezKO9]             NVARCHAR (50)  NULL,
    [DateKO10]           DATETIME       NULL,
    [RezKO10]            NVARCHAR (50)  NULL,
    [DateKO12]           DATETIME       NULL,
    [RezKO12]            NVARCHAR (50)  NULL,
    [DateKO13]           DATETIME       NULL,
    [RezKO13]            NVARCHAR (50)  NULL,
    [RezKO14]            NVARCHAR (50)  NULL,
    [RezKO15]            NVARCHAR (50)  NULL,
    [DateKO14]           DATETIME       NULL,
    [DateKO15]           DATETIME       NULL,
    [RezKO16]            NVARCHAR (50)  NULL,
    [DateKO16]           DATETIME       NULL,
    [RezKO17]            NVARCHAR (50)  NULL,
    [DateKO17]           DATETIME       NULL,
    [DateKO18]           DATETIME       NULL,
    [RezKO18]            NVARCHAR (50)  NULL,
    [DateKO19]           DATETIME       NULL,
    [RezKO19]            NVARCHAR (50)  NULL,
    [DateKO20]           DATETIME       NULL,
    [RezKO20]            NVARCHAR (50)  NULL,
    [RezKO22]            NVARCHAR (50)  NULL,
    [DateKO22]           DATETIME       NULL,
    [DateKO23]           DATETIME       NULL,
    [RezKO23]            NVARCHAR (50)  NULL,
    [DateKO24]           DATETIME       NULL,
    [RezKO24]            NVARCHAR (50)  NULL,
    [DateKO25]           DATETIME       NULL,
    [RezKO25]            NVARCHAR (50)  NULL,
    [DateKO26]           DATETIME       NULL,
    [RezKO26]            NVARCHAR (50)  NULL,
    [DateKO27]           DATETIME       NULL,
    [RezKO27]            NVARCHAR (50)  NULL,
    [RezKO28]            NVARCHAR (50)  NULL,
    [DateKO28]           DATETIME       NULL,
    [DateKO29]           DATETIME       NULL,
    [DateKO30]           DATETIME       NULL,
    [DateKO31]           DATETIME       NULL,
    [DateKO32]           DATETIME       NULL,
    [DateKO33]           DATETIME       NULL,
    [DateKO34]           DATETIME       NULL,
    [RezKO29]            NVARCHAR (50)  NULL,
    [RezKO30]            NVARCHAR (50)  NULL,
    [RezKO31]            NVARCHAR (50)  NULL,
    [RezKO32]            NVARCHAR (50)  NULL,
    [RezKO33]            NVARCHAR (50)  NULL,
    [RezKO34]            NVARCHAR (50)  NULL,
    [RezKO35]            NVARCHAR (50)  NULL,
    [DateKO35]           DATETIME       NULL,
    [DateKO36]           DATETIME       NULL,
    [DateKO37]           DATETIME       NULL,
    [DateKO38]           DATETIME       NULL,
    [RezKO36]            NVARCHAR (50)  NULL,
    [RezKO37]            NVARCHAR (50)  NULL,
    [RezKO38]            NVARCHAR (50)  NULL,
    [RezKO39]            NVARCHAR (50)  NULL,
    [DateKO39]           DATETIME       NULL,
    [DateKO40]           DATETIME       NULL,
    [DateKO41]           DATETIME       NULL,
    [DateKO42]           DATETIME       NULL,
    [RezKO40]            NVARCHAR (50)  NULL,
    [RezKO41]            NVARCHAR (50)  NULL,
    [RezKO42]            NVARCHAR (50)  NULL,
    [RezKO43]            NVARCHAR (50)  NULL,
    [Zaklyuchenie1]      NTEXT          NULL,
    [DateOsm]            DATETIME       NULL,
    [VrachP]             INT            NULL,
    [DopSvedenia]        NVARCHAR (50)  NULL,
    [LastName]           NVARCHAR (20)  NULL,
    [FirstName]          NVARCHAR (20)  NULL,
    [SecondName]         NVARCHAR (20)  NULL,
    [DocType]            INT            NULL,
    [Inactive]           BIT            NULL,
    CONSTRAINT [IndividualnayaKartaDonoraOotsitovPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IndividualnayaKartaDonoraOotsitovToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
