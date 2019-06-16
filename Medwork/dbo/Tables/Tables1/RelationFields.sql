CREATE TABLE [dbo].[RelationFields] (
    [GUID]          VARCHAR (32)  NOT NULL,
    [FromTableGUID] NVARCHAR (32) NULL,
    [FromFieldGUID] NVARCHAR (32) NULL,
    [ToTableGUID]   NVARCHAR (32) NULL,
    [ToFieldGUID]   NVARCHAR (32) NULL,
    [Relation]      BIT           NULL,
    [RelationGUID]  NVARCHAR (32) NULL,
    PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FK_RelationFields_Relation] FOREIGN KEY ([RelationGUID]) REFERENCES [dbo].[RelationsAndConstraints] ([GUID]),
    CONSTRAINT [FK_RelationFieldsFrom_Fields] FOREIGN KEY ([FromFieldGUID]) REFERENCES [dbo].[Fields] ([guid]),
    CONSTRAINT [FK_RelationFieldsTo_Fields] FOREIGN KEY ([ToFieldGUID]) REFERENCES [dbo].[Fields] ([guid])
);

