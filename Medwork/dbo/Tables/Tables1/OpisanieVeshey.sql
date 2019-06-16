CREATE TABLE [dbo].[OpisanieVeshey] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [Name]     NVARCHAR (50) NULL,
    [Comment]  NTEXT         NULL,
    [Count]    INT           NULL,
    CONSTRAINT [OpisanieVesheyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OpisanieVesheyToKvitantsiyaOPriemeVeshey] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[KvitantsiyaOPriemeVeshey] ([ID]) ON DELETE CASCADE
);

