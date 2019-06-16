CREATE TABLE [dbo].[Anizeykoniya] (
    [ID]    INT        NOT NULL,
    [PatID] INT        NULL,
    [MER1]  INT        NULL,
    [OD1]   FLOAT (53) NULL,
    [OS1]   FLOAT (53) NULL,
    [MER2]  INT        NULL,
    [OD2]   FLOAT (53) NULL,
    [OS2]   FLOAT (53) NULL,
    [MER3]  INT        NULL,
    [OD3]   FLOAT (53) NULL,
    [OS3]   FLOAT (53) NULL,
    [MER4]  INT        NULL,
    [OD4]   FLOAT (53) NULL,
    [OS4]   FLOAT (53) NULL,
    [Prim]  NTEXT      NULL,
    CONSTRAINT [AnizeykoniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnizeykoniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

