CREATE TABLE [dbo].[RecurrencePatterns] (
    [ID]            INT      IDENTITY (1, 1) NOT NULL,
    [DayScheduleID] INT      NOT NULL,
    [Start]         DATETIME NOT NULL,
    [Finish]        DATETIME NOT NULL,
    [rCount]        INT      NOT NULL,
    [DayNumber]     INT      NOT NULL,
    [DayType]       INT      NOT NULL,
    [OccurDays]     INT      NOT NULL,
    [Periodicity]   INT      NOT NULL,
    [Recurrence]    INT      NOT NULL,
    [isAct]         BIT      NULL,
    CONSTRAINT [pkRecurrencePatternsID] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [fkRecurrencePatternsDelCascade] FOREIGN KEY ([DayScheduleID]) REFERENCES [dbo].[daySchedules] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [fkRecurrencePatternsDS] FOREIGN KEY ([DayScheduleID]) REFERENCES [dbo].[daySchedules] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [idxRecurrencePatterns_dayScheduleID]
    ON [dbo].[RecurrencePatterns]([DayScheduleID] ASC);

