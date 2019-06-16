CREATE TABLE [dbo].[KompyuterniyFotokeratograf] (
    [ID]          INT   NOT NULL,
    [PatID]       INT   NULL,
    [Image1]      IMAGE NULL,
    [Osobennosti] NTEXT NULL,
    CONSTRAINT [KompyuterniyFotokeratografPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KompyuterniyFotokeratografToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

