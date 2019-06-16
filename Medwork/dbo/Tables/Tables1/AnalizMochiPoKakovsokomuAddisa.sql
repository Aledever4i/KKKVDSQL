CREATE TABLE [dbo].[AnalizMochiPoKakovsokomuAddisa] (
    [PatID]                  INT        NULL,
    [ID]                     INT        NOT NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [Leykotsiti]             FLOAT (53) NULL,
    [Eritrotsiti]            FLOAT (53) NULL,
    [Tsilindri]              FLOAT (53) NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [AnalizMochiPoKakovsokomuAddisaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizMochiPoKakovsokomuAddisaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

