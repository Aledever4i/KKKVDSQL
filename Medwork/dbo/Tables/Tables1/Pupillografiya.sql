CREATE TABLE [dbo].[Pupillografiya] (
    [ID]          INT   NOT NULL,
    [PatID]       INT   NULL,
    [Image1]      IMAGE NULL,
    [Osobennosti] NTEXT NULL,
    CONSTRAINT [PupillografiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PupillografiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

