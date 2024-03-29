﻿CREATE TABLE [dbo].[ProgrammaProfosmotra] (
    [ID]                                                   INT            NOT NULL,
    [PatID]                                                INT            NULL,
    [ProfosmotrID]                                         INT            NULL,
    [OrgID]                                                INT            NULL,
    [ProgrammaOsmotra]                                     NVARCHAR (250) NULL,
    [Uchastok]                                             NVARCHAR (50)  NULL,
    [Doljnost]                                             NVARCHAR (50)  NULL,
    [ProfosmotrType]                                       NVARCHAR (50)  NULL,
    [DictCombo1]                                           NVARCHAR (50)  NULL,
    [Zaklyuchenie]                                         NVARCHAR (100) NULL,
    [DispansGroup]                                         NVARCHAR (20)  NULL,
    [NuzhdaetsyaVObsledovaniiVTsentreProfpatologii]        BIT            NULL,
    [NuzhdaetsyaVStatsionarnomObsledovaniiILechenii]       BIT            NULL,
    [NuzhdaetsyaVSanatornoKurortnomLechenii]               BIT            NULL,
    [NuzhdaetsyaVLechebnoProfilakticheskomPitanii]         BIT            NULL,
    [NuzhdaetsyaVDispansernomNablyudenii]                  BIT            NULL,
    [NuzhdaetsyaVNapravleniiNaMedikoSotsialnuyuEkspertizu] BIT            NULL,
    [Recomendacii]                                         NTEXT          NULL,
    [NuzhdaetsyaVAmbulatornomObsledovaniiILechenii]        BIT            NULL,
    [DateIzv]                                              DATETIME       NULL,
    [NomerIzv]                                             NVARCHAR (20)  NULL,
    [ResultDop]                                            NTEXT          NULL,
    [PredsedatelVrachKom]                                  NVARCHAR (50)  NULL,
    [Staj]                                                 NVARCHAR (10)  NULL,
    [PrichinaNe]                                           NVARCHAR (50)  NULL,
    [DataZaklucheniya]                                     DATETIME       NULL,
    [NomerKvitancii]                                       NVARCHAR (20)  NULL,
    [DateFld]                                              DATETIME       NULL,
    [OsobieOtmetki]                                        NTEXT          NULL,
    CONSTRAINT [ProgrammaProfosmotraPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProgrammaProfosmotraToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

