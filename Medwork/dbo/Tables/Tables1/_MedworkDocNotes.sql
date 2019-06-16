CREATE TABLE [dbo].[_MedworkDocNotes] (
    [UID]           UNIQUEIDENTIFIER NOT NULL,
    [PatFormID]     INT              NULL,
    [LinkedTable]   NVARCHAR (256)   NULL,
    [LinkedTableID] INT              NULL,
    [TextData]      NVARCHAR (2000)  NULL,
    [aTop]          INT              NULL,
    [aLeft]         INT              NULL,
    [Width]         INT              NULL,
    [Height]        INT              NULL,
    [Color]         INT              NULL,
    [CreateDate]    DATETIME         NULL,
    [UpdateDate]    DATETIME         NULL,
    [CreatedBy]     INT              NULL,
    [UpdatedBy]     INT              NULL,
    CONSTRAINT [FK__MedworkDocNotes_PatForm] FOREIGN KEY ([PatFormID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE CLUSTERED INDEX [IX__MedworkDocNotes]
    ON [dbo].[_MedworkDocNotes]([PatFormID] ASC, [LinkedTable] ASC, [LinkedTableID] ASC, [CreatedBy] ASC);

