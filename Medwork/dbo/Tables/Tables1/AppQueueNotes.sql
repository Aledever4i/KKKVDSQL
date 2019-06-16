CREATE TABLE [dbo].[AppQueueNotes] (
    [ID]         INT            NOT NULL,
    [MasterID]   INT            NULL,
    [Author]     INT            NULL,
    [CreateDate] DATETIME       NULL,
    [Notes]      NVARCHAR (255) NULL,
    CONSTRAINT [AppQueueNotesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AppQueueNotesToAppQueue] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AppQueue] ([ID]) ON DELETE CASCADE
);

