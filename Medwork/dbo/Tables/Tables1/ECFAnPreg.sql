CREATE TABLE [dbo].[ECFAnPreg] (
    [Id]         INT        NOT NULL,
    [ParentId]   INT        NULL,
    [PatId]      INT        NULL,
    [ExecDate]   DATETIME   NULL,
    [HG]         FLOAT (53) NULL,
    [HGDate]     DATETIME   NULL,
    [PregTypeId] INT        NULL,
    [Fetuses]    INT        NULL,
    [OperId]     INT        NULL,
    [OriginalID] INT        NULL,
    CONSTRAINT [PK_ECFAnPreg] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ECFAnPreg_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

