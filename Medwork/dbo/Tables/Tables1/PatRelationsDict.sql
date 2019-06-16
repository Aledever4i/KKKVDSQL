CREATE TABLE [dbo].[PatRelationsDict] (
    [ID]               INT           NOT NULL,
    [RelationName]     NVARCHAR (50) NULL,
    [AntiRelationName] NVARCHAR (50) NULL,
    CONSTRAINT [PatRelationsDictPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

