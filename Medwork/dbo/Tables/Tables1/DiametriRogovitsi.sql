CREATE TABLE [dbo].[DiametriRogovitsi] (
    [ID]         INT        NOT NULL,
    [PatID]      INT        NULL,
    [VMD]        FLOAT (53) NULL,
    [VMS]        FLOAT (53) NULL,
    [GMD]        FLOAT (53) NULL,
    [GMS]        FLOAT (53) NULL,
    [Prim]       NTEXT      NULL,
    [RecNo]      INT        NULL,
    [ExportTime] DATETIME   NULL,
    CONSTRAINT [DiametriRogovitsiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DiametriRogovitsiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

