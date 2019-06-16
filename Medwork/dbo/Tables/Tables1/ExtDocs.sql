CREATE TABLE [dbo].[ExtDocs] (
    [Id]         INT           NOT NULL,
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
    CONSTRAINT [PK_ExtDocs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExtDocs_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

