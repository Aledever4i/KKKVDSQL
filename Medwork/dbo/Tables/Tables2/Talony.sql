CREATE TABLE [dbo].[Talony] (
    [ID]       INT      NOT NULL,
    [PatId]    INT      NULL,
    [Data]     DATETIME NULL,
    [cabinet]  INT      NULL,
    [Talon]    INT      NULL,
    [UserID]   INT      NULL,
    [Duration] INT      NULL,
    CONSTRAINT [TalonyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

