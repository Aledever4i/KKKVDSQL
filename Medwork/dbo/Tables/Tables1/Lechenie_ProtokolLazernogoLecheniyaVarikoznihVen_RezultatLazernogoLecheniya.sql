CREATE TABLE [dbo].[Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen_RezultatLazernogoLecheniya] (
    [ID]            INT           NOT NULL,
    [PatID]         INT           NULL,
    [MasterID]      INT           NULL,
    [DataOsmotra]   DATETIME      NULL,
    [boli]          NVARCHAR (50) NULL,
    [Ozhog]         NVARCHAR (1)  NULL,
    [Infiltratsiya] NVARCHAR (1)  NULL,
    [Pigmentatsiya] NVARCHAR (1)  NULL,
    [Parestezii]    NVARCHAR (1)  NULL,
    [Flebit]        NVARCHAR (1)  NULL,
    [Reflyuks]      NVARCHAR (1)  NULL,
    [skleroterapia] NVARCHAR (50) NULL,
    [dlinakulti]    FLOAT (53)    NULL,
    [obliteracia]   NVARCHAR (50) NULL,
    [rekanalizacia] NVARCHAR (50) NULL,
    [Vrach2]        INT           NULL,
    CONSTRAINT [Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen_RezultatLazernogoLecheniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen_RezultatLazernogoLecheniyaToLechenie_ProtokolLazernogoLecheniyaVarikoznihVen] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen] ([ID]) ON DELETE CASCADE
);

