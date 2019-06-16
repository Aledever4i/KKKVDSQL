CREATE TABLE [dbo].[Variable] (
    [Name]  VARCHAR (100)  NOT NULL,
    [SPID]  INT            NOT NULL,
    [Value] VARCHAR (1024) NULL,
    CONSTRAINT [Variable_PK] PRIMARY KEY CLUSTERED ([Name] ASC, [SPID] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[Variable] TO PUBLIC
    AS [dbo];

