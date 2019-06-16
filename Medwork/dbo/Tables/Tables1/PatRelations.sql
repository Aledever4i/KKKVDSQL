CREATE TABLE [dbo].[PatRelations] (
    [ID]         INT NOT NULL,
    [Pat1ID]     INT NULL,
    [Pat2ID]     INT NULL,
    [RelationID] INT NULL,
    CONSTRAINT [PatRelationsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PatRelations_PatRelationsDict] FOREIGN KEY ([RelationID]) REFERENCES [dbo].[PatRelationsDict] ([ID])
);

