CREATE TABLE [dbo].[ListLechebnihMerop] (
    [ID]                     INT            NOT NULL,
    [PatID]                  INT            NULL,
    [KemNapravlen]           NVARCHAR (100) NULL,
    [CelObrasheniya]         NVARCHAR (100) NULL,
    [KakoeLecheniePoluchil]  NTEXT          NULL,
    [Obsledovanie]           NTEXT          NULL,
    [LechenieLekPreparatami] NTEXT          NULL,
    [Gipnoterapiya]          DATETIME       NULL,
    [SeansiNagruzki]         DATETIME       NULL,
    [HolodnotropnoeDihanie]  DATETIME       NULL,
    [SemeynayaPsihoterapiya] DATETIME       NULL,
    [DrugieVidPomoshi]       NTEXT          NULL,
    [Rekomend]               NTEXT          NULL,
    [Ocenka]                 NTEXT          NULL,
    [Vrach]                  INT            NULL,
    [Data]                   DATETIME       NULL,
    CONSTRAINT [ListLechebnihMeropPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ListLechebnihMeropToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

