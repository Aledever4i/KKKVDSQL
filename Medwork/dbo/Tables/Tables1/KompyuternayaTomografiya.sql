CREATE TABLE [dbo].[KompyuternayaTomografiya] (
    [ID]          INT   NOT NULL,
    [PatID]       INT   NULL,
    [Image1]      IMAGE NULL,
    [Osobennosti] NTEXT NULL,
    CONSTRAINT [KompyuternayaTomografiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KompyuternayaTomografiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

