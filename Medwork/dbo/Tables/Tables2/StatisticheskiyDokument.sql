CREATE TABLE [dbo].[StatisticheskiyDokument] (
    [ID]       INT NOT NULL,
    [PatID]    INT NULL,
    [UniDocId] INT NULL,
    CONSTRAINT [StatisticheskiyDokumentPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [StatisticheskiyDokumentToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO

Create Trigger trDeleteStatDok
On StatisticheskiyDokument
For Delete
As 
  Delete From UD_Patient Where id in (Select d.UniDocId From Deleted d)
