CREATE TABLE [dbo].[VizometriyaSKontaktnoyLinzoy] (
    [ID]    INT        NOT NULL,
    [PatID] INT        NULL,
    [CLOS]  FLOAT (53) NULL,
    [VISOS] FLOAT (53) NULL,
    [CLOD]  FLOAT (53) NULL,
    [VISOD] FLOAT (53) NULL,
    [Prim]  NTEXT      NULL,
    CONSTRAINT [VizometriyaSKontaktnoyLinzoyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VizometriyaSKontaktnoyLinzoyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

