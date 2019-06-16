CREATE TABLE [dbo].[EfiPL] (
    [ID]           INT   NOT NULL,
    [PatID]        INT   NULL,
    [ODPorogCuvst] INT   NULL,
    [ODLabilnost]  INT   NULL,
    [OSPorogCuvst] INT   NULL,
    [OSLabilnost]  INT   NULL,
    [Prim]         NTEXT NULL,
    CONSTRAINT [EfiPLPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EfiPLToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

