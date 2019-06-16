CREATE TABLE [dbo].[TemplateDaySchedules] (
    [ID]        INT           IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (50) NULL,
    [isDefault] BIT           NULL,
    CONSTRAINT [pkTDSchedID] PRIMARY KEY CLUSTERED ([ID] ASC)
);

