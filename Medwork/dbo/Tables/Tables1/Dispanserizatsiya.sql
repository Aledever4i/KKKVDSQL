CREATE TABLE [dbo].[Dispanserizatsiya] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [DispanserizatsiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DispanserizatsiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

