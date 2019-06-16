CREATE TABLE [dbo].[FRep_AvgPayments] (
    [GUID]                                   UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]                               INT              NULL,
    [ConnectionID]                           INT              NULL,
    [Год]                                    INT              NULL,
    [Месяц]                                  INT              NULL,
    [С]                                      DATETIME         NULL,
    [По]                                     DATETIME         NULL,
    [Среднее кол-во пациентов в день]        FLOAT (53)       NULL,
    [Средняя сумма оплаты в день]            MONEY            NULL,
    [Средняя сумма оплат на пациента в день] MONEY            NULL,
    [Общая сумма оплат за период]            MONEY            NULL,
    CONSTRAINT [FRep_AvgPaymentsPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_AvgPaymentsToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

