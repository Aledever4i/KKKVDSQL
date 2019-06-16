CREATE TABLE [dbo].[dict] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [Type]     INT            NULL,
    [NodeType] NVARCHAR (50)  NULL,
    [FormId]   INT            NULL,
    [Column]   NVARCHAR (255) NULL,
    [Code]     NVARCHAR (50)  NULL,
    [text]     NVARCHAR (255) NULL,
    [text2]    VARCHAR (127)  NULL,
    [ord]      INT            NULL,
    CONSTRAINT [dictPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DictText]
    ON [dbo].[dict]([text] ASC);


GO
CREATE NONCLUSTERED INDEX [DictColumnName]
    ON [dbo].[dict]([Column] ASC);

