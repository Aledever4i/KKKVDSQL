CREATE TABLE [dbo].[Kategoriya] (
    [ID]          INT            NOT NULL,
    [Parent]      INT            NULL,
    [Name]        NVARCHAR (100) NULL,
    [NodeType]    NVARCHAR (12)  NULL,
    [Primechanie] NTEXT          NULL,
    [Code]        NVARCHAR (12)  NULL,
    CONSTRAINT [Kategoriya_PK_Idx] PRIMARY KEY CLUSTERED ([ID] ASC)
);

