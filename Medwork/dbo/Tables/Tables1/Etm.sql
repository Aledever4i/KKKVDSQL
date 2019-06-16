CREATE TABLE [dbo].[Etm] (
    [ID]         INT      NOT NULL,
    [PatID]      INT      NULL,
    [OD5]        INT      NULL,
    [OS5]        INT      NULL,
    [OD75]       INT      NULL,
    [OS75]       INT      NULL,
    [OD10]       INT      NULL,
    [OS10]       INT      NULL,
    [OD15]       INT      NULL,
    [OS15]       INT      NULL,
    [Prim]       NTEXT    NULL,
    [RecNo]      INT      NULL,
    [ExportTime] DATETIME NULL,
    CONSTRAINT [EtmPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EtmToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

