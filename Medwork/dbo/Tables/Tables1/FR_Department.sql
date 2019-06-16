CREATE TABLE [dbo].[FR_Department] (
    [ID]   INT           NOT NULL,
    [Code] INT           NULL,
    [Name] NVARCHAR (40) NULL,
    CONSTRAINT [FR_DepartmentPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

