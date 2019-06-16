CREATE TABLE [dbo].[ECFCryo] (
    [Id]         INT           NOT NULL,
    [ParentId]   INT           NULL,
    [PatId]      INT           NULL,
    [ExecDate]   DATETIME      NULL,
    [PayNeed]    BIT           NULL,
    [Payed]      BIT           NULL,
    [PaySum]     MONEY         NULL,
    [PayedSum]   MONEY         NULL,
    [PayDate]    DATETIME      NULL,
    [PayComment] VARCHAR (255) NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    CONSTRAINT [PK_ECFCryo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ECFCryo_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

