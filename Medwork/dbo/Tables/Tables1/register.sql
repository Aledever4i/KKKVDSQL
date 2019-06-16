CREATE TABLE [dbo].[register] (
    [Sections]  NVARCHAR (255) NULL,
    [kod]       NVARCHAR (255) NULL,
    [name]      NVARCHAR (255) NULL,
    [UETdoctor] FLOAT (53)     NULL,
    [UETsister] FLOAT (53)     NULL,
    [id]        INT            NOT NULL,
    CONSTRAINT [PK_register] PRIMARY KEY CLUSTERED ([id] ASC)
);

