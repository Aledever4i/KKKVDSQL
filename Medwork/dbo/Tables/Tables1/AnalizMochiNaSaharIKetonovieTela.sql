CREATE TABLE [dbo].[AnalizMochiNaSaharIKetonovieTela] (
    [ID]                     INT            NOT NULL,
    [PatID]                  INT            NULL,
    [NomerAnaliza]           INT            NULL,
    [DataProvedeniyaAnaliza] DATETIME       NULL,
    [Sahar]                  FLOAT (53)     NULL,
    [KetonovieTela]          NVARCHAR (1)   NULL,
    [Vrach]                  INT            NULL,
    [Sahar1]                 NVARCHAR (500) NULL,
    CONSTRAINT [AnalizMochiNaSaharIKetonovieTelaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizMochiNaSaharIKetonovieTelaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

