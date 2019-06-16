CREATE TABLE [dbo].[ECF] (
    [Id]         INT           NOT NULL,
    [PatId]      INT           NULL,
    [ExecDate]   DATETIME      NULL,
    [TryNo]      INT           NULL,
    [HereTryNo]  INT           NULL,
    [PayNeed]    BIT           NULL,
    [Payed]      BIT           NULL,
    [PaySum]     MONEY         NULL,
    [PayedSum]   MONEY         NULL,
    [PayDate]    DATETIME      NULL,
    [PayComment] VARCHAR (255) NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    [Stim]       NVARCHAR (50) NULL,
    [PGDPlan]    BIT           NULL,
    CONSTRAINT [PK_ECF] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ECF_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idxECF_Stim]
    ON [dbo].[ECF]([Stim] ASC);

