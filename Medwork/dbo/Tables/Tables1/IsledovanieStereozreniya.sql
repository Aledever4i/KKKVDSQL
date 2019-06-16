CREATE TABLE [dbo].[IsledovanieStereozreniya] (
    [ID]    INT        NOT NULL,
    [PatID] INT        NULL,
    [SPH]   FLOAT (53) NULL,
    [CYL]   FLOAT (53) NULL,
    [AX]    FLOAT (53) NULL,
    [SPH1]  FLOAT (53) NULL,
    [CYL1]  FLOAT (53) NULL,
    [AX1]   FLOAT (53) NULL,
    [STNC]  INT        NULL,
    [STC]   INT        NULL,
    [Prim]  NTEXT      NULL,
    CONSTRAINT [IsledovanieStereozreniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IsledovanieStereozreniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

