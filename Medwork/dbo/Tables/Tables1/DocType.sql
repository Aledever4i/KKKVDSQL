CREATE TABLE [dbo].[DocType] (
    [ID]   INT            NOT NULL,
    [Name] NVARCHAR (100) NULL,
    [GUID] NVARCHAR (32)  NOT NULL,
    CONSTRAINT [DocTypePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

