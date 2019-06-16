﻿CREATE TABLE [dbo].[Forma025U] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [strachcomp]     NVARCHAR (50) NULL,
    [NomerstrPolica] NVARCHAR (50) NULL,
    [KatLgotnosti]   NVARCHAR (50) NULL,
    [DocLgot]        NVARCHAR (50) NULL,
    [Familia]        NVARCHAR (50) NULL,
    [Name]           NVARCHAR (50) NULL,
    [Otchestvo]      NVARCHAR (50) NULL,
    [Sex]            NVARCHAR (50) NULL,
    [DateBirth]      DATETIME      NULL,
    [seria]          NVARCHAR (50) NULL,
    [Number]         NVARCHAR (50) NULL,
    [vydan]          NVARCHAR (50) NULL,
    [adresspost]     NVARCHAR (50) NULL,
    [adress]         NTEXT         NULL,
    [adrreg]         NTEXT         NULL,
    [teldom]         NVARCHAR (50) NULL,
    [telrab]         NVARCHAR (50) NULL,
    [doclgotnosti]   NTEXT         NULL,
    [Mestorab]       NVARCHAR (50) NULL,
    [dolzhnost]      NVARCHAR (50) NULL,
    [snils]          NVARCHAR (50) NULL,
    [TipDocumenta]   NVARCHAR (50) NULL,
    [cardnum]        NVARCHAR (20) NULL,
    [BarCodeImage]   IMAGE         NULL,
    [Invalidnost]    NVARCHAR (50) NULL,
    [proff]          NVARCHAR (50) NULL,
    [ijdivenec]      NVARCHAR (50) NULL,
    CONSTRAINT [Forma025UPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Forma025UToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
