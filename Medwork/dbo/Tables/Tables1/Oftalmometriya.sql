CREATE TABLE [dbo].[Oftalmometriya] (
    [ID]    INT        NOT NULL,
    [PatID] INT        NULL,
    [od3]   FLOAT (53) NULL,
    [od1]   INT        NULL,
    [od2]   INT        NULL,
    [od4]   FLOAT (53) NULL,
    [os1]   INT        NULL,
    [os3]   FLOAT (53) NULL,
    [os4]   FLOAT (53) NULL,
    [os2]   INT        NULL,
    [Prim]  NTEXT      NULL,
    CONSTRAINT [OftalmometriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OftalmometriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

