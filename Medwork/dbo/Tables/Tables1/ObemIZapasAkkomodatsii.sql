CREATE TABLE [dbo].[ObemIZapasAkkomodatsii] (
    [ID]     INT        NOT NULL,
    [PatID]  INT        NULL,
    [PPOD]   FLOAT (53) NULL,
    [PROD]   FLOAT (53) NULL,
    [PCHAST] FLOAT (53) NULL,
    [PPPROD] FLOAT (53) NULL,
    [PPOS]   FLOAT (53) NULL,
    [PROS]   FLOAT (53) NULL,
    [OCHAST] FLOAT (53) NULL,
    [PPPROS] FLOAT (53) NULL,
    [Prim]   NTEXT      NULL,
    CONSTRAINT [ObemIZapasAkkomodatsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ObemIZapasAkkomodatsiiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

