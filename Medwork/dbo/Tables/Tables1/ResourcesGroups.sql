CREATE TABLE [dbo].[ResourcesGroups] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [GroupName]    NVARCHAR (100) NOT NULL,
    [ResourceList] TEXT           NULL,
    CONSTRAINT [PK_ResourcesGroups] PRIMARY KEY CLUSTERED ([ID] ASC)
);

