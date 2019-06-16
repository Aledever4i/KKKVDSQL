CREATE TABLE [dbo].[OftalmologicheskieDiagnozi] (
    [ID]      INT            NOT NULL,
    [PatID]   INT            NULL,
    [ODDIAG1] INT            NULL,
    [ODDIAG2] INT            NULL,
    [OSDIAG1] INT            NULL,
    [OSDIAG2] INT            NULL,
    [COMMENT] NVARCHAR (MAX) NULL,
    CONSTRAINT [DiagnoziOftalmologPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DiagnoziOftalmologToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

