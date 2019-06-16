CREATE TABLE [dbo].[SchedEvent] (
    [ID]                INT      NOT NULL,
    [PatID]             INT      NULL,
    [ResourceID]        INT      NULL,
    [ReceptionDateTime] DATETIME NULL,
    [Duration]          INT      NULL,
    [Title]             NTEXT    NULL,
    [Color]             INT      NULL,
    [Author]            INT      NULL,
    CONSTRAINT [SchedEventPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

