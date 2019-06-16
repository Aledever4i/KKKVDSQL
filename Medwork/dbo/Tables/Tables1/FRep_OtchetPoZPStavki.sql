CREATE TABLE [dbo].[FRep_OtchetPoZPStavki] (
    [GUID]                        UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]                    INT              NULL,
    [ConnectionID]                INT              NULL,
    [ФИО сотрудника]              NVARCHAR (100)   NULL,
    [Кол-во выходов]              INT              NULL,
    [Планируемое (из расписания)] INT              NULL,
    [Стоимость выхода]            MONEY            NULL,
    [Сумма оклада]                MONEY            NULL,
    [Сумма выплаты сотруднику]    MONEY            NULL,
    CONSTRAINT [FRep_OtchetPoZPStavkiPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_OtchetPoZPStavkiToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

