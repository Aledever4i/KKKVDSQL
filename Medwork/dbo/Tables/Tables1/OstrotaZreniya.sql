CREATE TABLE [dbo].[OstrotaZreniya] (
    [ID]         INT        NOT NULL,
    [PatID]      INT        NULL,
    [CylD]       FLOAT (53) NULL,
    [VisD]       FLOAT (53) NULL,
    [VisS]       FLOAT (53) NULL,
    [CylS]       FLOAT (53) NULL,
    [AxD]        INT        NULL,
    [AxS]        INT        NULL,
    [SphD]       FLOAT (53) NULL,
    [SphS]       FLOAT (53) NULL,
    [VisKD]      FLOAT (53) NULL,
    [VisKS]      FLOAT (53) NULL,
    [RecNo]      INT        NULL,
    [ExportTime] DATETIME   NULL,
    CONSTRAINT [OstrotaZreniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OstrotaZreniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

