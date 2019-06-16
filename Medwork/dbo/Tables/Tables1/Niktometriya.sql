CREATE TABLE [dbo].[Niktometriya] (
    [ID]    INT   NOT NULL,
    [PatID] INT   NULL,
    [TOD]   INT   NULL,
    [TOS]   INT   NULL,
    [TOD1]  INT   NULL,
    [TOS1]  INT   NULL,
    [Prim]  NTEXT NULL,
    CONSTRAINT [NiktometriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [NiktometriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

