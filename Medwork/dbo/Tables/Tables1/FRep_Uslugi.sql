CREATE TABLE [dbo].[FRep_Uslugi] (
    [GUID]            UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]        INT              NULL,
    [ConnectionID]    INT              NULL,
    [daydate]         DATETIME         NULL,
    [registrant]      NVARCHAR (150)   NULL,
    [pay_sum]         MONEY            NULL,
    [pay_count_pat]   INT              NULL,
    [pay_count_napr]  INT              NULL,
    [pay_count_uslug] INT              NULL,
    [oms_sum]         MONEY            NULL,
    [oms_count_pat]   INT              NULL,
    [oms_count_TAP]   INT              NULL,
    [oms_count_uslug] INT              NULL,
    CONSTRAINT [FRep_UslugiPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_UslugiToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

