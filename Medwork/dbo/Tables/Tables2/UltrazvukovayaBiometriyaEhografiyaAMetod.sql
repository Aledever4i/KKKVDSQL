CREATE TABLE [dbo].[UltrazvukovayaBiometriyaEhografiyaAMetod] (
    [ID]              INT        NOT NULL,
    [PatID]           INT        NULL,
    [DPKD]            FLOAT (53) NULL,
    [TXD]             FLOAT (53) NULL,
    [DGLD]            FLOAT (53) NULL,
    [DPKS]            FLOAT (53) NULL,
    [TXS]             FLOAT (53) NULL,
    [DGLS]            FLOAT (53) NULL,
    [NDSOD]           INT        NULL,
    [NDSOS]           INT        NULL,
    [TXTOD]           NTEXT      NULL,
    [TXTOS]           NTEXT      NULL,
    [RecNo]           INT        NULL,
    [ExportTime]      DATETIME   NULL,
    [RecNoF0120]      INT        NULL,
    [ExportTimeF0120] DATETIME   NULL,
    CONSTRAINT [UltrazvukovayaBiometriyaEhografiyaAMetodPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UltrazvukovayaBiometriyaEhografiyaAMetodToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

