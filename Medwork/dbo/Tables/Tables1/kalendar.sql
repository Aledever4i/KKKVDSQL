CREATE TABLE [dbo].[kalendar] (
    [ID]          INT           NOT NULL,
    [DayDate]     DATETIME      NULL,
    [Type]        INT           NULL,
    [TypeName]    NVARCHAR (50) NULL,
    [TypeDayOld]  INT           NULL,
    [TypeNameOld] NVARCHAR (50) NULL,
    [TypeOld]     INT           NULL,
    CONSTRAINT [kalendarPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

