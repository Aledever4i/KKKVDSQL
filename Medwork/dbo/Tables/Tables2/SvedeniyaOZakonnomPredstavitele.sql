CREATE TABLE [dbo].[SvedeniyaOZakonnomPredstavitele] (
    [ID]                INT            NOT NULL,
    [PatID]             INT            NULL,
    [LastName]          NVARCHAR (50)  NULL,
    [FirstName]         NVARCHAR (20)  NULL,
    [SecondName]        NVARCHAR (20)  NULL,
    [BirthDate]         DATETIME       NULL,
    [TipDocumenta]      NVARCHAR (50)  NULL,
    [SeriyaPasporta]    NVARCHAR (6)   NULL,
    [NomerPasporta]     NVARCHAR (25)  NULL,
    [KogdaVidanPasport] DATETIME       NULL,
    [KemVidanPasport]   NVARCHAR (80)  NULL,
    [DomTelefon]        NVARCHAR (50)  NULL,
    [RabTelefon]        NVARCHAR (50)  NULL,
    [Email]             NVARCHAR (100) NULL,
    [MobTelefon]        NVARCHAR (50)  NULL,
    [AdditionalInfo]    NVARCHAR (MAX) NULL,
    CONSTRAINT [SvedeniyaOZakonnomPredstavitelePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SvedeniyaOZakonnomPredstaviteleToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

