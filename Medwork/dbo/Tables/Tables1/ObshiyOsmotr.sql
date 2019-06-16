﻿CREATE TABLE [dbo].[ObshiyOsmotr] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [Data]                     DATETIME      NULL,
    [Vrach]                    NVARCHAR (50) NULL,
    [Akusherka]                NVARCHAR (50) NULL,
    [Rost]                     INT           NULL,
    [Ves]                      INT           NULL,
    [Temperatura]              FLOAT (53)    NULL,
    [KotorayaBeremennost]      INT           NULL,
    [Rodi]                     INT           NULL,
    [PoslednyayaMenstruatsiya] DATETIME      NULL,
    [PervoeSheveleniePloda]    DATETIME      NULL,
    [DSp]                      INT           NULL,
    [DCr]                      INT           NULL,
    [DTr]                      INT           NULL,
    [TazCExt]                  INT           NULL,
    [CDiag]                    INT           NULL,
    [TVera]                    INT           NULL,
    [OkruzhnostZhivotaSm]      INT           NULL,
    [VisotaDnaMatkiSm]         NVARCHAR (50) NULL,
    [PolozheniePloda]          NVARCHAR (50) NULL,
    [Pozitsiya]                NVARCHAR (50) NULL,
    [Vid]                      NVARCHAR (50) NULL,
    [SerdtsebieniePlodaMesto]  NVARCHAR (50) NULL,
    [ChisloUdarov]             INT           NULL,
    [PredlezhashayaChast]      NVARCHAR (50) NULL,
    [GdeNahoditsya]            NVARCHAR (50) NULL,
    [RodovayaDeyatelnost]      NVARCHAR (50) NULL,
    [EditBox1]                 INT           NULL,
    CONSTRAINT [ObshiyOsmotrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ObshiyOsmotrToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
