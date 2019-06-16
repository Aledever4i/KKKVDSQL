CREATE TABLE [dbo].[FRep_ReestruslugOMSpoSK] (
    [GUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]         INT              NULL,
    [ConnectionID]     INT              NULL,
    [СК]               NVARCHAR (MAX)   NULL,
    [Номер полиса]     NVARCHAR (MAX)   NULL,
    [ФИО пациента]     NVARCHAR (MAX)   NULL,
    [Количество услуг] INT              NULL,
    [Сумма услуг]      MONEY            NULL,
    CONSTRAINT [FRep_ReestruslugOMSpoSKPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_ReestruslugOMSpoSKToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

