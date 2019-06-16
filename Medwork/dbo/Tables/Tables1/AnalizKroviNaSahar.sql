CREATE TABLE [dbo].[AnalizKroviNaSahar] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [SaharVKrovi]            FLOAT (53) NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [AnalizKroviNaSaharPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizKroviNaSaharToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

