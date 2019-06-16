CREATE TABLE [dbo].[FRep_SpecAndKabinet] (
    [GUID]                                   UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]                               INT              NULL,
    [ConnectionID]                           INT              NULL,
    [Врач/кабинет]                           NVARCHAR (200)   NULL,
    [Специальность/кабинет]                  NVARCHAR (200)   NULL,
    [Идентификатор]                          INT              NULL,
    [Общая выручка по оплатам]               MONEY            NULL,
    [Кол-во посещений по направлениям]       INT              NULL,
    [Кол-во физ. лиц по направлениям]        INT              NULL,
    [Кол-во оказанных услуг по направлениям] INT              NULL,
    [Общая выручка по талонам]               MONEY            NULL,
    [Кол-во посещений по талонам]            INT              NULL,
    [Кол-во физ. лиц по талонам]             INT              NULL,
    [Кол-во оказанных услуг по талонам]      INT              NULL,
    CONSTRAINT [FRep_SpecAndKabinetPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_SpecAndKabinetToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

