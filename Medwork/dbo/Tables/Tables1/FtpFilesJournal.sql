CREATE TABLE [dbo].[FtpFilesJournal] (
    [ID]            INT           NOT NULL,
    [FileName]      NVARCHAR (50) NULL,
    [Operation]     NVARCHAR (10) NULL,
    [OperationTime] DATETIME      NULL,
    [Processed]     BIT           NULL,
    CONSTRAINT [FtpFilesJournalPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

