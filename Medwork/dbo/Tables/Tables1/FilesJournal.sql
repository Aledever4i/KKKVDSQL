CREATE TABLE [dbo].[FilesJournal] (
    [ID]                INT            NOT NULL,
    [Source]            NVARCHAR (50)  NULL,
    [FileName]          NVARCHAR (100) NULL,
    [Operation]         NVARCHAR (20)  NULL,
    [OperationDateTime] DATETIME       NULL,
    [Processed]         BIT            NULL,
    [patId]             INT            NULL,
    CONSTRAINT [FilesJournalPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FilesJournalSource]
    ON [dbo].[FilesJournal]([Source] ASC);


GO
CREATE NONCLUSTERED INDEX [FilesJournalFileName]
    ON [dbo].[FilesJournal]([FileName] ASC);

