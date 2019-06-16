CREATE TABLE [dbo].[CommonHolidays] (
    [Date]  DATETIME       NOT NULL,
    [Notes] NVARCHAR (100) NULL,
    CONSTRAINT [PK_CommonHolidays] PRIMARY KEY CLUSTERED ([Date] ASC)
);

