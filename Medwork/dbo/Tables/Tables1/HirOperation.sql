CREATE TABLE [dbo].[HirOperation] (
    [ID]          INT            NOT NULL,
    [MasterID]    INT            NULL,
    [name]        NVARCHAR (100) NULL,
    [Code]        NVARCHAR (10)  NULL,
    [Description] NTEXT          NULL,
    [NodeType]    NVARCHAR (12)  NULL,
    CONSTRAINT [HirOperationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

