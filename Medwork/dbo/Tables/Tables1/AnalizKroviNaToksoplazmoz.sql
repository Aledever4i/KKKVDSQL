CREATE TABLE [dbo].[AnalizKroviNaToksoplazmoz] (
    [ID]                     INT      NOT NULL,
    [PatID]                  INT      NULL,
    [NomerAnaliza]           INT      NULL,
    [DataProvedeniyaAnaliza] DATETIME NULL,
    [Vrach]                  INT      NULL,
    [PCKToksoplacma]         INT      NULL,
    CONSTRAINT [AnalizKroviNaToksoplazmozPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizKroviNaToksoplazmozToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

