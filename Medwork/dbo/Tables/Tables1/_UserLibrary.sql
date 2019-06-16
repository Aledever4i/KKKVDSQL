CREATE TABLE [dbo].[_UserLibrary] (
    [ID]         INT            NOT NULL,
    [Name]       NVARCHAR (255) NULL,
    [GUID]       NVARCHAR (32)  NOT NULL,
    [Data]       NTEXT          NULL,
    [Active]     BIT            NOT NULL,
    [Author]     INT            NOT NULL,
    [AuthorName] NVARCHAR (255) NULL,
    CONSTRAINT [PKUserLibraryID] PRIMARY KEY CLUSTERED ([ID] ASC)
);

