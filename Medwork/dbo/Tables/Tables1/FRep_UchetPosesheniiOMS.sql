CREATE TABLE [dbo].[FRep_UchetPosesheniiOMS] (
    [GUID]                                      UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]                                  INT              NULL,
    [ConnectionID]                              INT              NULL,
    [Врач]                                      NVARCHAR (MAX)   NULL,
    [Кол-во первичных посещений]                INT              NULL,
    [Кол-во повторных посещений]                INT              NULL,
    [Кол-во посещений с 1 услугой]              INT              NULL,
    [Количество посещений с 2 и более услугами] INT              NULL,
    CONSTRAINT [FRep_UchetPosesheniiOMSPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_UchetPosesheniiOMSToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

