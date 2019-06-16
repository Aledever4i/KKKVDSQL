CREATE TABLE [dbo].[AttachedFile] (
    [ID]    INT            NOT NULL,
    [PatID] INT            NULL,
    [Title] NVARCHAR (100) NULL,
    [Date]  DATETIME       NULL,
    CONSTRAINT [AttachedFilePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AttachedFileToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

