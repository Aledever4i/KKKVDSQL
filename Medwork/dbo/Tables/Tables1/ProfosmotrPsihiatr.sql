CREATE TABLE [dbo].[ProfosmotrPsihiatr] (
    [ID]             INT            NOT NULL,
    [PatID]          INT            NULL,
    [Data]           DATETIME       NULL,
    [Vrach]          INT            NULL,
    [Zaklyuchenie]   NVARCHAR (100) NULL,
    [Kommentrariy]   NTEXT          NULL,
    [Nauchete]       NVARCHAR (10)  NULL,
    [Nauchete2]      NVARCHAR (100) NULL,
    [GruppaD]        NVARCHAR (2)   NULL,
    [DiagnozPoMkb10] NVARCHAR (255) NULL,
    [KodPoMkb10]     NVARCHAR (10)  NULL,
    [Zhalobi]        NTEXT          NULL,
    [Recommendation] NTEXT          NULL,
    CONSTRAINT [ProfosmotrPsihiatrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProfosmotrPsihiatrToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

