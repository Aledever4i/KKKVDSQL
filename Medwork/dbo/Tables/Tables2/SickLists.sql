CREATE TABLE [dbo].[SickLists] (
    [Id]         INT           NOT NULL,
    [PatId]      INT           NULL,
    [Descr]      VARCHAR (150) NULL,
    [ExecDate]   DATETIME      NULL,
    [Serial]     VARCHAR (15)  NULL,
    [Number]     VARCHAR (15)  NULL,
    [Diagnosis]  VARCHAR (255) NULL,
    [EndDate]    DATETIME      NULL,
    [Prolong]    BIT           NULL,
    [KEK]        BIT           NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    CONSTRAINT [PK_SickLists] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SickLists_PatForm] FOREIGN KEY ([Id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

