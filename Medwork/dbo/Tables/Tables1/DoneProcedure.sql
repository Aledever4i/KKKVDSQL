﻿CREATE TABLE [dbo].[DoneProcedure] (
    [ID]         INT            NOT NULL,
    [MasterID]   INT            NULL,
    [Автор]      INT            NULL,
    [LastName]   NVARCHAR (50)  NULL,
    [PatId]      INT            NULL,
    [CardNum]    INT            NULL,
    [FirstName]  NVARCHAR (50)  NULL,
    [SecondName] NVARCHAR (50)  NULL,
    [Дата]       DATETIME       NULL,
    [Seans1]     DATETIME       NULL,
    [Seans2]     DATETIME       NULL,
    [Seans3]     DATETIME       NULL,
    [Seans4]     DATETIME       NULL,
    [Seans5]     DATETIME       NULL,
    [Seans10]    DATETIME       NULL,
    [Seans6]     DATETIME       NULL,
    [Seans7]     DATETIME       NULL,
    [Seans8]     DATETIME       NULL,
    [Seans9]     DATETIME       NULL,
    [Done1]      BIT            NULL,
    [Done2]      BIT            NULL,
    [Done3]      BIT            NULL,
    [Done4]      BIT            NULL,
    [Done5]      BIT            NULL,
    [Done6]      BIT            NULL,
    [Done7]      BIT            NULL,
    [Done8]      BIT            NULL,
    [Done9]      BIT            NULL,
    [Done10]     BIT            NULL,
    [Procedure]  NVARCHAR (100) NULL,
    CONSTRAINT [DoneProcedurePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

