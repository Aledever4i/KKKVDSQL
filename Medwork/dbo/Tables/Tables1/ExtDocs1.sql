CREATE TABLE [dbo].[ExtDocs1] (
    [Id]         INT           NOT NULL,
    [ParentId]   INT           NULL,
    [PatId]      INT           NULL,
    [Descr]      VARCHAR (150) NULL,
    [ExecDate]   DATETIME      NULL,
    [Lnk]        VARCHAR (255) NULL,
    [PayNeed]    BIT           NULL,
    [Payed]      BIT           NULL,
    [PaySum]     MONEY         NULL,
    [PayedSum]   MONEY         NULL,
    [PayDate]    DATETIME      NULL,
    [PayComment] VARCHAR (255) NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    CONSTRAINT [PK_ExtDocs1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExtDocs1_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

