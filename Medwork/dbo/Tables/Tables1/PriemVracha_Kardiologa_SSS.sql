CREATE TABLE [dbo].[PriemVracha_Kardiologa_SSS] (
    [ID]                   INT           NOT NULL,
    [PatID]                INT           NULL,
    [Puls]                 INT           NULL,
    [Defitsit]             INT           NULL,
    [Napryazhenie]         NVARCHAR (80) NULL,
    [GranitsiSerdtsa]      NVARCHAR (50) NULL,
    [ToniSerdtsa]          NVARCHAR (50) NULL,
    [VerhushechniyTolchok] NVARCHAR (50) NULL,
    [Napolnenie]           NVARCHAR (50) NULL,
    [NadSosudami]          NVARCHAR (27) NULL,
    [AdNaPravoyRuke]       INT           NULL,
    [AdNaPravoyRuke1]      INT           NULL,
    [Harakteristika]       NVARCHAR (27) NULL,
    [AdNaLevoyRuke]        INT           NULL,
    [AdNaLevoyRuke1]       INT           NULL,
    [ShumiSerdtsa]         NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_Kardiologa_SSSPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Kardiologa_SSSToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

