CREATE TABLE [dbo].[Job] (
    [Name]     NVARCHAR (50) NULL,
    [ID]       INT           NOT NULL,
    [parentid] INT           NULL,
    [nodetype] VARCHAR (10)  NULL,
    CONSTRAINT [aaaaaJob_PK] PRIMARY KEY NONCLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1]
    ON [dbo].[Job]([ID] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[Job] TO PUBLIC
    AS [dbo];

