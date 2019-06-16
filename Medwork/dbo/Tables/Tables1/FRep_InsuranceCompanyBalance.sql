CREATE TABLE [dbo].[FRep_InsuranceCompanyBalance] (
    [GUID]            UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]        INT              NULL,
    [ConnectionID]    INT              NULL,
    [Наименование СК] NVARCHAR (70)    NULL,
    [Номер договора]  INT              NULL,
    [Сумма счета]     MONEY            NULL,
    [Сумма по актам]  MONEY            NULL,
    [Дата счета]      DATETIME         NULL,
    [Дата оплаты]     DATETIME         NULL,
    [Сумма оплаты]    MONEY            NULL,
    [Задолженность]   MONEY            NULL,
    [Комментарий]     VARCHAR (MAX)    NULL,
    PRIMARY KEY NONCLUSTERED ([GUID] ASC)
);

