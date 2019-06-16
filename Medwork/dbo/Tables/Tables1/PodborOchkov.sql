CREATE TABLE [dbo].[PodborOchkov] (
    [ID]          INT        NOT NULL,
    [PatID]       INT        NULL,
    [CylD]        FLOAT (53) NULL,
    [VisD]        FLOAT (53) NULL,
    [VisS]        FLOAT (53) NULL,
    [CylS]        FLOAT (53) NULL,
    [AxD]         INT        NULL,
    [AxS]         INT        NULL,
    [SphD]        FLOAT (53) NULL,
    [SphS]        FLOAT (53) NULL,
    [RecNo]       INT        NULL,
    [RecNo1]      INT        NULL,
    [ExportTime]  DATETIME   NULL,
    [ExportTime1] DATETIME   NULL,
    CONSTRAINT [PodborOchkovPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PodborOchkovToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

