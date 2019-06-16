CREATE TABLE [dbo].[GynApp] (
    [Id]           INT           NOT NULL,
    [PatId]        INT           NULL,
    [Descr]        VARCHAR (150) NULL,
    [ExecDate]     DATETIME      NULL,
    [ImgId]        IMAGE         NULL,
    [KolpoComment] NTEXT         NULL,
    [Diag]         NTEXT         NULL,
    [PayNeed]      BIT           NULL,
    [Payed]        BIT           NULL,
    [PaySum]       MONEY         NULL,
    [PayedSum]     MONEY         NULL,
    [PayDate]      DATETIME      NULL,
    [PayComment]   VARCHAR (255) NULL,
    [OperId]       INT           NULL,
    [OriginalID]   INT           NULL,
    CONSTRAINT [PK_GynApp] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GynApp_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

