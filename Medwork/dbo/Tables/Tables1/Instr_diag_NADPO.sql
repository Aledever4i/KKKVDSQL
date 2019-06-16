CREATE TABLE [dbo].[Instr_diag_NADPO] (
    [ID]        INT   NOT NULL,
    [PatID]     INT   NULL,
    [Vrach2]    INT   NULL,
    [Apparatto] NTEXT NULL,
    CONSTRAINT [Instr_diag_NADPOPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Instr_diag_NADPOToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

