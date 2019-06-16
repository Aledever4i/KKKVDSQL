CREATE TABLE [dbo].[HormAn] (
    [Id]         INT        NOT NULL,
    [DocTypeId]  INT        NULL,
    [MasterID]   INT        NULL,
    [ExecDate]   DATETIME   NULL,
    [E2]         FLOAT (53) NULL,
    [Prog]       FLOAT (53) NULL,
    [LG]         FLOAT (53) NULL,
    [Test]       FLOAT (53) NULL,
    [OperId]     INT        NULL,
    [OriginalID] INT        NULL,
    CONSTRAINT [PK_ECFAnPunc] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_HormAn_ECFAnStim] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ECFAnStim] ([Id]) ON DELETE CASCADE
);

