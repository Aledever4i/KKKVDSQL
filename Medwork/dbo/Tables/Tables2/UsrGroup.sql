CREATE TABLE [dbo].[UsrGroup] (
    [GroupID]     SMALLINT       NOT NULL,
    [Name]        NVARCHAR (255) NULL,
    [Rights]      NVARCHAR (255) NULL,
    [Comment]     NVARCHAR (50)  NULL,
    [Profile]     NTEXT          NULL,
    [LastUpdated] ROWVERSION     NULL,
    [DMS]         BIT            CONSTRAINT [DF_UsrGroup_DMS] DEFAULT (0) NULL,
    [GUID]        VARCHAR (32)   DEFAULT (replace(newid(),'-','')) NULL,
    [GlobalUID]   VARCHAR (32)   DEFAULT (replace(newid(),'-','')) NULL,
    [GroupGUID]   VARCHAR (32)   NULL,
    CONSTRAINT [aaaaaUsrGroup_PK] PRIMARY KEY NONCLUSTERED ([GroupID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [Name]
    ON [dbo].[UsrGroup]([Name] ASC);


GO
CREATE NONCLUSTERED INDEX [NUMBER]
    ON [dbo].[UsrGroup]([GroupID] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[UsrGroup] TO PUBLIC
    AS [dbo];

