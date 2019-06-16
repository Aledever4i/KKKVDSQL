CREATE TABLE [dbo].[PhysApp] (
    [Id]         INT           NOT NULL,
    [PatId]      INT           NULL,
    [Descr]      VARCHAR (150) NULL,
    [ExecDate]   DATETIME      NULL,
    [ECG]        NTEXT         NULL,
    [Diag]       NTEXT         NULL,
    [PayNeed]    BIT           NULL,
    [Payed]      BIT           NULL,
    [PaySum]     MONEY         NULL,
    [PayedSum]   MONEY         NULL,
    [PayDate]    DATETIME      NULL,
    [PayComment] VARCHAR (255) NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    CONSTRAINT [PK_PhysApp] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PhysApp_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

