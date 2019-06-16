CREATE TABLE [dbo].[BedPattern] (
    [ID]               INT      NOT NULL,
    [MasterID]         INT      NULL,
    [BedProfile]       INT      NULL,
    [MainCount]        INT      NULL,
    [UnderRepairCount] INT      NULL,
    [AddedCount]       INT      NULL,
    [StartDate]        DATETIME NULL,
    [EndDate]          DATETIME NULL,
    CONSTRAINT [BedPatternPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BedPatternToDept] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Dept] ([ID]) ON DELETE CASCADE
);

