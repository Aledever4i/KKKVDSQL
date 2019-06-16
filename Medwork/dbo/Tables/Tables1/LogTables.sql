CREATE TABLE [dbo].[LogTables] (
    [GUID]             NVARCHAR (32) NOT NULL,
    [DataBaseName]     VARCHAR (50)  NULL,
    [TableName]        VARCHAR (50)  NULL,
    [KeyTypeGUID]      NVARCHAR (32) NULL,
    [BaseClassGUID]    NVARCHAR (32) NULL,
    [DisplayFieldGUID] NVARCHAR (32) NULL,
    PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FK_LogTables_Form] FOREIGN KEY ([GUID]) REFERENCES [dbo].[Form] ([GUID])
);

