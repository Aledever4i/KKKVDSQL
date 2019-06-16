CREATE TABLE [dbo].[CorrectionPatterns] (
    [ID]            INT      IDENTITY (1, 1) NOT NULL,
    [DayScheduleID] INT      NOT NULL,
    [Date]          DATETIME NOT NULL,
    [isAct]         BIT      NOT NULL,
    CONSTRAINT [pkCorrectionPatternsID] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [fkCorrectionPatternsDelCascade] FOREIGN KEY ([DayScheduleID]) REFERENCES [dbo].[daySchedules] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [fkCorrectionPatternsDS] FOREIGN KEY ([DayScheduleID]) REFERENCES [dbo].[daySchedules] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [idxCorrectionPatterns_dayScheduleID]
    ON [dbo].[CorrectionPatterns]([DayScheduleID] ASC);

