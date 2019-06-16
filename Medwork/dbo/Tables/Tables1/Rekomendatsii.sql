CREATE TABLE [dbo].[Rekomendatsii] (
    [ID]            INT   NOT NULL,
    [PatID]         INT   NULL,
    [Rekomendatsii] NTEXT NULL,
    CONSTRAINT [RekomendatsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RekomendatsiiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

