CREATE TABLE [dbo].[Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen_LazernoeVozdeystvie] (
    [ID]                  INT           NOT NULL,
    [PatID]               INT           NULL,
    [MasterID]            INT           NULL,
    [ObjectVozd]          NVARCHAR (50) NULL,
    [moshnost]            INT           NULL,
    [DlinaVeni]           FLOAT (53)    NULL,
    [Diametr]             INT           NULL,
    [kolichestvoimpulsov] INT           NULL,
    [energyJ]             INT           NULL,
    [svetovodi]           INT           NULL,
    [anestezia]           INT           NULL,
    [skleroterapia]       NVARCHAR (50) NULL,
    [flebektomia]         NVARCHAR (50) NULL,
    CONSTRAINT [Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen_LazernoeVozdeystviePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen_LazernoeVozdeystvieToLechenie_ProtokolLazernogoLecheniyaVarikoznihVen] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen] ([ID]) ON DELETE CASCADE
);

