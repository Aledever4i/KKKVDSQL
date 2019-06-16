CREATE TABLE [dbo].[CardMZT1] (
    [Id]         INT           NOT NULL,
    [DocTypeId]  INT           NULL,
    [MasterID]   INT           NULL,
    [ExecDate]   DATETIME      NULL,
    [ExamType]   VARCHAR (255) NULL,
    [ExamRes]    VARCHAR (255) NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    CONSTRAINT [PK_CardMZT1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CardMZT1_CardMZ] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[CardMZ] ([Id]) ON DELETE CASCADE
);

