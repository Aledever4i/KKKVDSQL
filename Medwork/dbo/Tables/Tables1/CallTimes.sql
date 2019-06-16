CREATE TABLE [dbo].[CallTimes] (
    [ID]        INT           NOT NULL,
    [Name]      VARCHAR (255) NULL,
    [StartTime] DATETIME      NULL,
    [Interval]  INT           NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

