CREATE TABLE [dbo].[InfomatAdditionalCheck] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [GUID]     NVARCHAR (50) NULL,
    [Comment]  NTEXT         NULL,
    CONSTRAINT [InfomatAdditionalCheckPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InfomatAdditionalCheckToInfomatParams] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[InfomatParams] ([ID]) ON DELETE CASCADE
);

