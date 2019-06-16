CREATE TABLE [dbo].[FRep_OtchetPoZPUslugi] (
    [GUID]                              UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]                          INT              NULL,
    [ConnectionID]                      INT              NULL,
    [Дата оказания услуги]              DATETIME         NULL,
    [ФИО сотрудника]                    NVARCHAR (100)   NULL,
    [Код услуги]                        NVARCHAR (50)    NULL,
    [Наименование услуги]               NVARCHAR (MAX)   NULL,
    [Программа прикрепления]            NVARCHAR (MAX)   NULL,
    [Кол-во услуг]                      FLOAT (53)       NULL,
    [Сумма выплат за одну услугу]       MONEY            NULL,
    [Итоговая, суммы выплаты за услугу] MONEY            NULL,
    [Сумма по услуге]                   MONEY            NULL,
    CONSTRAINT [FRep_OtchetPoZPUslugiPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_OtchetPoZPUslugiToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

