CREATE TABLE [dbo].[Algezimetriya] (
    [ID]    INT   NOT NULL,
    [PatID] INT   NULL,
    [OD]    INT   NULL,
    [OS]    INT   NULL,
    [Prim]  NTEXT NULL,
    CONSTRAINT [AlgezimetriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AlgezimetriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

