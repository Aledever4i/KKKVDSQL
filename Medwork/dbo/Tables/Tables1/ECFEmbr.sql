CREATE TABLE [dbo].[ECFEmbr] (
    [Id]         INT           NOT NULL,
    [ParentId]   INT           NULL,
    [PatId]      INT           NULL,
    [PuncId]     INT           NULL,
    [ExecDate]   DATETIME      NULL,
    [DonorNum]   NVARCHAR (20) NULL,
    [Envir1Id]   INT           NULL,
    [Envir2Id]   INT           NULL,
    [OilId]      INT           NULL,
    [Closed]     BIT           NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    [DocNum]     INT           NULL,
    CONSTRAINT [PK_ECFEmbr] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ECFEmbr_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

