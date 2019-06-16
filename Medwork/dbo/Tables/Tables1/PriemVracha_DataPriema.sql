CREATE TABLE [dbo].[PriemVracha_DataPriema] (
    [ID]      INT      NOT NULL,
    [PatID]   INT      NULL,
    [Data1]   DATETIME NULL,
    [DocTime] DATETIME NULL,
    CONSTRAINT [PriemVracha_DataPriemaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_DataPriemaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

