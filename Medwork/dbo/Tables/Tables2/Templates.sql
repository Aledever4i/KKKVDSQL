CREATE TABLE [dbo].[Templates] (
    [ID]       INT           NOT NULL,
    [Name]     VARCHAR (255) NULL,
    [ParentID] INT           NULL,
    [NodeType] VARCHAR (15)  NULL,
    [Text]     NTEXT         NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

