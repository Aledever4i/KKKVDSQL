CREATE TABLE [dbo].[BiometriyaAMetod] (
    [ID]           INT        NOT NULL,
    [PatID]        INT        NULL,
    [ODKamera]     FLOAT (53) NULL,
    [ODXrustalic]  FLOAT (53) NULL,
    [ODDlina]      FLOAT (53) NULL,
    [OSDlina1]     FLOAT (53) NULL,
    [OSXrustalic1] FLOAT (53) NULL,
    [OSKamera1]    FLOAT (53) NULL,
    [Prim]         NTEXT      NULL,
    CONSTRAINT [BiometriyaAMetodPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BiometriyaAMetodToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

