CREATE TABLE [dbo].[RelationsAndConstraints] (
    [GUID]             NVARCHAR (32)  NOT NULL,
    [RelationTypeGUID] NVARCHAR (32)  NULL,
    [JoinCondition]    NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FK_RelationsAndConstraints_Form] FOREIGN KEY ([GUID]) REFERENCES [dbo].[Form] ([GUID])
);

