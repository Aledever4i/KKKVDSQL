CREATE TABLE [dbo].[StatisticDict] (
    [Id]      INT           NOT NULL,
    [Value]   INT           NULL,
    [Name]    VARCHAR (100) NULL,
    [GroupId] INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

