CREATE TABLE [dbo].[_MedworkDocAttachments] (
    [ID]            INT            NOT NULL,
    [PatFormID]     INT            NULL,
    [LinkedTable]   NVARCHAR (256) NULL,
    [LinkedTableID] INT            NULL,
    [FileName]      NVARCHAR (255) NOT NULL,
    [PackType]      NVARCHAR (10)  NULL,
    [Size]          INT            NOT NULL,
    [Source]        NVARCHAR (50)  NULL,
    [FileType]      NVARCHAR (50)  NULL,
    [AttachDate]    DATETIME       NOT NULL,
    [UpdateDate]    DATETIME       NULL,
    [AttachedBy]    INT            NOT NULL,
    [UpdatedBy]     INT            NULL,
    [Data]          IMAGE          NULL,
    CONSTRAINT [PK__MedworkDocAttachments] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__MedworkDocAttachments_PatForm] FOREIGN KEY ([PatFormID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX__MedworkDocAttachments]
    ON [dbo].[_MedworkDocAttachments]([PatFormID] ASC, [LinkedTable] ASC, [LinkedTableID] ASC);

