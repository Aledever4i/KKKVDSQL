CREATE TABLE [dbo].[KVB] (
    [ID]       INT            NOT NULL,
    [Code]     NVARCHAR (20)  NULL,
    [NodeType] NVARCHAR (12)  NULL,
    [DiagText] NVARCHAR (255) NULL,
    [parent]   INT            NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

