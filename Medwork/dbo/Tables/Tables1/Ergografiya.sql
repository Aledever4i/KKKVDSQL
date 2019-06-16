CREATE TABLE [dbo].[Ergografiya] (
    [ID]    INT           NOT NULL,
    [PatID] INT           NULL,
    [TOD]   NVARCHAR (20) NULL,
    [TOS]   NVARCHAR (20) NULL,
    [Prim]  NTEXT         NULL,
    CONSTRAINT [ErgografiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ErgografiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

