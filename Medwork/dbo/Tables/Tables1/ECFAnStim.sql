CREATE TABLE [dbo].[ECFAnStim] (
    [Id]         INT      NOT NULL,
    [ParentId]   INT      NULL,
    [PatId]      INT      NULL,
    [ExecDate]   DATETIME NULL,
    [OriginalID] INT      NULL,
    CONSTRAINT [PK_ECFAnStim] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ECFAnStim_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

