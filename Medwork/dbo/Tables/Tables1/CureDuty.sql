CREATE TABLE [dbo].[CureDuty] (
    [Id]         INT           NOT NULL,
    [PatId]      INT           NULL,
    [Descr]      VARCHAR (150) NULL,
    [ExecDate]   DATETIME      NULL,
    [ArtId]      INT           NULL,
    [Qty]        INT           NULL,
    [Course]     NTEXT         NULL,
    [PayNeed]    BIT           NULL,
    [Payed]      BIT           NULL,
    [PaySum]     MONEY         NULL,
    [PayedSum]   MONEY         NULL,
    [PayDate]    DATETIME      NULL,
    [PayComment] VARCHAR (255) NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    CONSTRAINT [PK_CureDuty] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CureDuty_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

