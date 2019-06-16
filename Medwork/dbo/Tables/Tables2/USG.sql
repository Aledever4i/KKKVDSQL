CREATE TABLE [dbo].[USG] (
    [Id]         INT        NOT NULL,
    [DocTypeId]  INT        NULL,
    [MasterID]   INT        NULL,
    [ExecDate]   DATETIME   NULL,
    [Endo]       FLOAT (53) NULL,
    [OperId]     INT        NULL,
    [Img1Id]     IMAGE      NULL,
    [Img2Id]     IMAGE      NULL,
    [Img3Id]     IMAGE      NULL,
    [Img4Id]     IMAGE      NULL,
    [Img5Id]     IMAGE      NULL,
    [OriginalID] INT        NULL,
    CONSTRAINT [PK_USG] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_USG_ECFAnStim] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ECFAnStim] ([Id]) ON DELETE CASCADE
);

