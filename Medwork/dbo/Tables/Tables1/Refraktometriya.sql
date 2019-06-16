CREATE TABLE [dbo].[Refraktometriya] (
    [ID]        INT           NOT NULL,
    [PatID]     INT           NULL,
    [Data]      DATETIME      NULL,
    [Vrach]     NVARCHAR (50) NULL,
    [Sfera]     INT           NULL,
    [Tsilindr]  INT           NULL,
    [Os]        INT           NULL,
    [Tsilindr1] INT           NULL,
    [Os1]       INT           NULL,
    [Sfera1]    INT           NULL,
    CONSTRAINT [RefraktometriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RefraktometriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

