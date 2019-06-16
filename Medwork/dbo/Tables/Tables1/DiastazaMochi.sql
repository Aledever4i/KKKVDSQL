CREATE TABLE [dbo].[DiastazaMochi] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [DiastazaMochi]          FLOAT (53) NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [DiastazaMochiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DiastazaMochiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

