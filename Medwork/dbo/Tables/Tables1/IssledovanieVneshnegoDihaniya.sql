﻿CREATE TABLE [dbo].[IssledovanieVneshnegoDihaniya] (
    [ID]                      INT           NOT NULL,
    [PatID]                   INT           NULL,
    [FIOObsleduemogo]         NVARCHAR (80) NULL,
    [Temperatura]             FLOAT (53)    NULL,
    [Davlenie]                INT           NULL,
    [SistemaDolzhnihVelichin] NVARCHAR (50) NULL,
    [Data]                    DATETIME      NULL,
    [Vremya]                  DATETIME      NULL,
    [DolzhnoeZnachenieZhel]   INT           NULL,
    [IzmerennoeZnachenieZhel] INT           NULL,
    [OtDolzhnoy]              FLOAT (53)    NULL,
    [DihatelniyObemDo]        INT           NULL,
    [RezervniyObemVdohaRovd]  INT           NULL,
    [Data1]                   DATETIME      NULL,
    [Vremya1]                 DATETIME      NULL,
    [KrivayaPotokObem]        IMAGE         NULL,
    [KrivayaPotokObem1]       IMAGE         NULL,
    [Data2]                   DATETIME      NULL,
    [Vremya2]                 DATETIME      NULL,
    [IzmerennoeZnachenieMvl]  FLOAT (53)    NULL,
    [Zaklyuchenie]            NTEXT         NULL,
    CONSTRAINT [IssledovanieVneshnegoDihaniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IssledovanieVneshnegoDihaniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

