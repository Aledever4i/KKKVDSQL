﻿CREATE TABLE [dbo].[UnifitsirovannayaVrachebnayaForma] (
    [ID]                      INT           NOT NULL,
    [PatID]                   INT           NULL,
    [Data]                    DATETIME      NULL,
    [VremyaOsmotra]           DATETIME      NULL,
    [Vrach]                   INT           NULL,
    [AnamnesisiMorbi]         NTEXT         NULL,
    [Zhalobi]                 NTEXT         NULL,
    [AnamnesisVitae]          NTEXT         NULL,
    [EpidAnamnez]             NTEXT         NULL,
    [EkspertniyAnamnez]       NVARCHAR (50) NULL,
    [FrontovoyAnamnez]        NVARCHAR (50) NULL,
    [StatusPraesensCommunis]  NTEXT         NULL,
    [OrganiDihaniya]          NTEXT         NULL,
    [OrganiKrovoobrasheniya]  NTEXT         NULL,
    [OrganiPishevareniya]     NTEXT         NULL,
    [OrganiVideleniya]        NTEXT         NULL,
    [NervnayaSistema]         NTEXT         NULL,
    [Klindiagnoz]             NTEXT         NULL,
    [PlanObsledovaniya]       NTEXT         NULL,
    [PlanLecheniya]           NTEXT         NULL,
    [LechashiyVrach]          INT           NULL,
    [EditBox2]                NVARCHAR (50) NULL,
    [DiagnozOsnovnoy]         NVARCHAR (50) NULL,
    [DiagnozSoputstvuyushiy1] NTEXT         NULL,
    [DiagnozSoputstvuyushiy]  NVARCHAR (50) NULL,
    CONSTRAINT [UnifitsirovannayaVrachebnayaFormaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UnifitsirovannayaVrachebnayaFormaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
