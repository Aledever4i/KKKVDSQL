CREATE TABLE [dbo].[Quota_Linked] (
    [QuotaMasterID] INT NULL,
    [QuotaLinkedID] INT NULL,
    CONSTRAINT [FK_Quota_Linked_QuotaMasterID] FOREIGN KEY ([QuotaMasterID]) REFERENCES [dbo].[Quota] ([ID]) ON DELETE CASCADE
);

