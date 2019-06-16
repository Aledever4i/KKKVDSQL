CREATE TABLE [dbo].[IshodiObrasheniya] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [IshodiObrasheniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IshodiObrasheniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

