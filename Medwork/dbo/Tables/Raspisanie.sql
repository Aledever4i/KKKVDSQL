CREATE TABLE [dbo].[Raspisanie] (
    [ID]          INT           NOT NULL,
    [MasterID]    INT           NULL,
    [Name]        NVARCHAR (40) NULL,
    [D1]          BIT           NULL,
    [D2]          BIT           NULL,
    [D3]          BIT           NULL,
    [D4]          BIT           NULL,
    [D5]          BIT           NULL,
    [D6]          BIT           NULL,
    [D7]          BIT           NULL,
    [StartTime]   DATETIME      NULL,
    [EndTime]     DATETIME      NULL,
    [StartDate]   DATETIME      NULL,
    [EndDate]     DATETIME      NULL,
    [Primechanie] NTEXT         NULL,
    [DeptID]      INT           NULL,
    [WeekFilter]  INT           NULL,
    [Actual]      BIT           NULL,
    [Interval]    INT           NULL,
    [UserID]      INT           NULL,
    CONSTRAINT [RaspisaniePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

