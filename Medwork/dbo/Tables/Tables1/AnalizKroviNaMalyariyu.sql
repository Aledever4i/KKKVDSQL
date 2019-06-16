CREATE TABLE [dbo].[AnalizKroviNaMalyariyu] (
    [ID]                     INT      NOT NULL,
    [PatID]                  INT      NULL,
    [NomerAnaliza]           INT      NULL,
    [DataProvedeniyaAnaliza] DATETIME NULL,
    [Vrach]                  INT      NULL,
    [PLMalaria]              INT      NULL,
    CONSTRAINT [AnalizKroviNaMalyariyuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizKroviNaMalyariyuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

