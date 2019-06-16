CREATE TABLE [dbo].[TemplateTimeIntervals] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [dayScheduleID]     INT           NOT NULL,
    [BeginTime]         DATETIME      NOT NULL,
    [EndTime]           DATETIME      NOT NULL,
    [LinkedResourceID]  INT           NULL,
    [Type]              INT           NOT NULL,
    [Text]              NVARCHAR (50) NULL,
    [ReceptionInterval] INT           NOT NULL,
    [Quota]             INT           NULL,
    [Color]             INT           NULL,
    [AppointmentColor]  INT           NULL,
    CONSTRAINT [pkTemplateTIntervalID] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [fkTemplateTIntervalDS] FOREIGN KEY ([dayScheduleID]) REFERENCES [dbo].[TemplateDaySchedules] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [fkTemplateTIntervalType] FOREIGN KEY ([Type]) REFERENCES [dbo].[TimeIntervalTypes] ([ID])
);

