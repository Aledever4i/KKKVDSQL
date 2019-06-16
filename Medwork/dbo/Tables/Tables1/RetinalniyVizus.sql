CREATE TABLE [dbo].[RetinalniyVizus] (
    [ID]    INT        NOT NULL,
    [PatID] INT        NULL,
    [VISOD] FLOAT (53) NULL,
    [VisOS] FLOAT (53) NULL,
    [Prim]  NTEXT      NULL,
    CONSTRAINT [RetinalniyVizusPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RetinalniyVizusToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

