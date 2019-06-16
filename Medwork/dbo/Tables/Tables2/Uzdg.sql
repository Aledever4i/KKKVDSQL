CREATE TABLE [dbo].[Uzdg] (
    [ID]     INT      NOT NULL,
    [PatID]  INT      NULL,
    [Data1]  DATETIME NULL,
    [Vrach2] INT      NULL,
    [Data2]  DATETIME NULL,
    [Vrach3] INT      NULL,
    [Memo1]  NTEXT    NULL,
    [Memo2]  NTEXT    NULL,
    CONSTRAINT [UzdgToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

