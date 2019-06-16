CREATE TABLE [dbo].[AnalizKala] (
    [ID]                         INT           NOT NULL,
    [PatID]                      INT           NULL,
    [DataVzyatiyaBiomateriala]   DATETIME      NULL,
    [AnalizKalaNomer]            NVARCHAR (50) NULL,
    [Kolichestvo]                NVARCHAR (50) NULL,
    [Konsistentsiya]             NVARCHAR (50) NULL,
    [Forma]                      NVARCHAR (50) NULL,
    [Zapah]                      NVARCHAR (50) NULL,
    [Tsvet]                      NVARCHAR (50) NULL,
    [Reaktsiya]                  NVARCHAR (50) NULL,
    [Sliz]                       NVARCHAR (50) NULL,
    [Krov]                       NVARCHAR (50) NULL,
    [OstatkiNeperevarennoyPishi] NVARCHAR (50) NULL,
    [ReaktsiyaNaSkrituyuKrov]    NTEXT         NULL,
    [ReaktsiyaNaSterkobilin]     NTEXT         NULL,
    [ReaktsiyaNaBilirubin]       NVARCHAR (50) NULL,
    CONSTRAINT [AnalizKalaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizKalaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

