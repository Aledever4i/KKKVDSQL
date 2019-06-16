CREATE TABLE [dbo].[ECFAnest] (
    [Id]         INT      NOT NULL,
    [ParentId]   INT      NULL,
    [PatId]      INT      NULL,
    [ExecDate]   DATETIME NULL,
    [Diag]       NTEXT    NULL,
    [OperId]     INT      NULL,
    [OriginalID] INT      NULL,
    CONSTRAINT [PK_ECFAnest] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ECFAnest_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

