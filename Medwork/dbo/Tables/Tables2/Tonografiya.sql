CREATE TABLE [dbo].[Tonografiya] (
    [ID]         INT        NOT NULL,
    [PatID]      INT        NULL,
    [PD]         FLOAT (53) NULL,
    [ODDv]       FLOAT (53) NULL,
    [CD]         FLOAT (53) NULL,
    [FD]         FLOAT (53) NULL,
    [PS]         FLOAT (53) NULL,
    [OSDv]       FLOAT (53) NULL,
    [CS]         FLOAT (53) NULL,
    [FS]         FLOAT (53) NULL,
    [Prim]       NTEXT      NULL,
    [PCD]        FLOAT (53) NULL,
    [PCS]        FLOAT (53) NULL,
    [RecNo]      INT        NULL,
    [ExportTime] DATETIME   NULL,
    CONSTRAINT [TonografiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TonografiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

