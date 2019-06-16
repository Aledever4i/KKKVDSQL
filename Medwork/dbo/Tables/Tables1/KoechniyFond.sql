CREATE TABLE [dbo].[KoechniyFond] (
    [ID]          INT           NOT NULL,
    [Palata]      NVARCHAR (20) NULL,
    [Otdelenie]   NVARCHAR (60) NULL,
    [KolVoMest]   INT           NULL,
    [NeRabotaet]  NVARCHAR (1)  NULL,
    [Primechanie] NTEXT         NULL,
    [TipPalati]   NVARCHAR (25) NULL,
    [Atributi]    NVARCHAR (25) NULL,
    CONSTRAINT [KoechniyFondPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

