CREATE TABLE [dbo].[OsmotrManualnogoTerapevta] (
    [ID]                           INT           NOT NULL,
    [PatID]                        INT           NULL,
    [Vrach]                        NVARCHAR (50) NULL,
    [Data]                         DATETIME      NULL,
    [Zhalobi]                      NTEXT         NULL,
    [AnamnezZabolevaniya]          NTEXT         NULL,
    [Diagnoz]                      NTEXT         NULL,
    [NaznachennoeIssledovanie]     NVARCHAR (50) NULL,
    [ProvedNnieManipulyatsii]      NVARCHAR (50) NULL,
    [PerenosimostManipulyatsii]    NVARCHAR (50) NULL,
    [EffektOtManipulyatsii]        NVARCHAR (50) NULL,
    [EffektivnostProvedNnogoKursa] NVARCHAR (50) NULL,
    [KodPoMkb10]                   NVARCHAR (10) NULL,
    [DiagnozPoMkb10]               NVARCHAR (80) NULL,
    CONSTRAINT [OsmotrManualnogoTerapevtaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrManualnogoTerapevtaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

