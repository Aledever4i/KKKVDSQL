CREATE TABLE [dbo].[FotoDoc] (
    [ID]    INT            NOT NULL,
    [PatID] INT            NULL,
    [Image] IMAGE          NULL,
    [Title] NVARCHAR (100) NULL,
    CONSTRAINT [FotoDocPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FotoDocToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

