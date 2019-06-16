CREATE TABLE [dbo].[FRep_PatDiagnozesNapravlenie] (
    [GUID]         UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]     INT              NULL,
    [ConnectionID] INT              NULL,
    [Диагноз]      NVARCHAR (100)   NULL,
    [Пациент]      NVARCHAR (300)   NULL,
    [Дата]         DATETIME         NULL,
    CONSTRAINT [FRep_PatDiagnozesNapravleniePrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_PatDiagnozesNapravlenieToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

