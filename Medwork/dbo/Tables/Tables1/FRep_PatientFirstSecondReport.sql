CREATE TABLE [dbo].[FRep_PatientFirstSecondReport] (
    [GUID]                   UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]               INT              NULL,
    [ConnectionID]           INT              NULL,
    [Тип пациента]           NVARCHAR (20)    NULL,
    [Номер карты]            NVARCHAR (10)    NULL,
    [Ф.И.О. пациента]        NVARCHAR (100)   NULL,
    [Количество направлений] NVARCHAR (100)   NULL,
    CONSTRAINT [FRep_PatientFirstSecondReportPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_PatientFirstSecondReportToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

