CREATE TABLE [dbo].[_MedworkCustomParams] (
    [ID]       INT           NOT NULL,
    [Name]     VARCHAR (255) NULL,
    [ParentID] INT           NULL,
    [NodeType] VARCHAR (15)  NULL,
    [Title]    VARCHAR (255) NULL,
    [Сomment]  NTEXT         NULL,
    [value]    VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

