CREATE TABLE [dbo].[FRep_AvgEffect] (
    [GUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]         INT              NULL,
    [ConnectionID]     INT              NULL,
    [Источник рекламы] NVARCHAR (100)   NULL,
    [Звонки]           INT              NULL,
    [Зарегистрировано] INT              NULL,
    [Записано]         INT              NULL,
    [Пришло]           INT              NULL,
    [Оказано]          MONEY            NULL,
    CONSTRAINT [FRep_AvgEffectPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_AvgEffectToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

