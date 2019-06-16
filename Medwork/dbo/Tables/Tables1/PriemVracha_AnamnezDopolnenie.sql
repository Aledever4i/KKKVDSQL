CREATE TABLE [dbo].[PriemVracha_AnamnezDopolnenie] (
    [ID]                        INT           NOT NULL,
    [PatID]                     INT           NULL,
    [AnamnezZhizni1]            NTEXT         NULL,
    [AnamnezZhizni2]            NTEXT         NULL,
    [ZhilishnieUsloviya1]       NTEXT         NULL,
    [ProfessionalnieVrednosti2] NTEXT         NULL,
    [Operatsii2]                NTEXT         NULL,
    [gemotransfuzii]            NTEXT         NULL,
    [AnamnezZhizn]              NVARCHAR (50) NULL,
    [MKBName]                   NVARCHAR (50) NULL,
    [MKBCode]                   NVARCHAR (50) NULL,
    [AnamnezZhizni]             NTEXT         NULL,
    [Kurenie]                   NVARCHAR (50) NULL,
    [Alcogol]                   NVARCHAR (50) NULL,
    [UpotreblenieNarkotikov]    NVARCHAR (50) NULL,
    [SmokeYears]                INT           NULL,
    [SmokePerDay]               INT           NULL,
    [travmimemo]                NTEXT         NULL,
    CONSTRAINT [PriemVracha_AnamnezDopolneniePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_AnamnezDopolnenieToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

