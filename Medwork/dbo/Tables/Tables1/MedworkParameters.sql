CREATE TABLE [dbo].[MedworkParameters] (
    [NAME]  NVARCHAR (100) NOT NULL,
    [VALUE] SQL_VARIANT    NULL,
    CONSTRAINT [PK_MedworkParameters] PRIMARY KEY CLUSTERED ([NAME] ASC)
);

