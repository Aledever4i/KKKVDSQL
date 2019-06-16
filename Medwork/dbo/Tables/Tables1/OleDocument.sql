CREATE TABLE [dbo].[OleDocument] (
    [ID]           INT            NOT NULL,
    [PatID]        INT            NULL,
    [OLEContainer] IMAGE          NULL,
    [Title]        NVARCHAR (100) NULL,
    CONSTRAINT [OleDocumentPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OleDocumentToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

