CREATE TABLE [dbo].[DeptType] (
    [ID]       INT           NOT NULL,
    [Tip]      NVARCHAR (50) NULL,
    [NodeType] NVARCHAR (12) NULL,
    CONSTRAINT [DeptTypePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

