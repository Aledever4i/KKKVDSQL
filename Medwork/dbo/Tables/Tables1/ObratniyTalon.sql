﻿CREATE TABLE [dbo].[ObratniyTalon] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [Dates]                    DATETIME      NULL,
    [Datepo]                   DATETIME      NULL,
    [lechenie]                 NTEXT         NULL,
    [Da]                       NVARCHAR (1)  NULL,
    [Net]                      NVARCHAR (1)  NULL,
    [Transfuzii2]              NTEXT         NULL,
    [prichotkl]                NTEXT         NULL,
    [Memo1]                    NTEXT         NULL,
    [RezLech]                  NVARCHAR (50) NULL,
    [obostr]                   NVARCHAR (50) NULL,
    [rekomendpolech]           NTEXT         NULL,
    [epikriz]                  NTEXT         NULL,
    [FamilyName]               NVARCHAR (50) NULL,
    [DocNum]                   NVARCHAR (50) NULL,
    [DocDate]                  DATETIME      NULL,
    [FirstName]                NVARCHAR (20) NULL,
    [SecondName]               NVARCHAR (20) NULL,
    [OrgName]                  NVARCHAR (20) NULL,
    [DiagNaprav]               NVARCHAR (50) NULL,
    [DiagOsnInv]               NVARCHAR (50) NULL,
    [DiagSoput1]               NVARCHAR (50) NULL,
    [DiagSoput2]               NVARCHAR (50) NULL,
    [Diagnoznapravivshego8]    NVARCHAR (50) NULL,
    [DiagSoput3]               NVARCHAR (50) NULL,
    [DiagSoput4]               NVARCHAR (50) NULL,
    [Doctor]                   NVARCHAR (50) NULL,
    [MainDoctor]               NVARCHAR (50) NULL,
    [SootvStand]               NVARCHAR (1)  NULL,
    [DiagOsnInv2]              NVARCHAR (50) NULL,
    [StandardDenyCause]        NTEXT         NULL,
    [Comment]                  NTEXT         NULL,
    [ProceduresCancelDiseases] BIT           NULL,
    [SanKurKarta]              NVARCHAR (50) NULL,
    [OGRN]                     NVARCHAR (50) NULL,
    [DoctorID]                 INT           NULL,
    [DiagSoput3Lb]             VARCHAR (255) NULL,
    [DiagSoput4Lb]             VARCHAR (255) NULL,
    [DiagOsnInv2Lb]            VARCHAR (255) NULL,
    CONSTRAINT [ObratniyTalonPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ObratniyTalonToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

