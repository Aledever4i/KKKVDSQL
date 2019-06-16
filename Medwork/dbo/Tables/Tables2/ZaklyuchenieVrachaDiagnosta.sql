CREATE TABLE [dbo].[ZaklyuchenieVrachaDiagnosta] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [Method]     NVARCHAR (50) NULL,
    [Conclusion] NTEXT         NULL,
    [Date]       DATETIME      NULL,
    [DoctorID]   INT           NULL,
    CONSTRAINT [ZaklyuchenieVrachaDiagnostaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ZaklyuchenieVrachaDiagnostaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

