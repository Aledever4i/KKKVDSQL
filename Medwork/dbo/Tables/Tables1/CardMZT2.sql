CREATE TABLE [dbo].[CardMZT2] (
    [Id]         INT      NOT NULL,
    [DocTypeId]  INT      NULL,
    [MasterID]   INT      NULL,
    [ExecDate]   DATETIME NULL,
    [Diagnosis]  NTEXT    NULL,
    [FTime]      BIT      NULL,
    [FTimeProf]  BIT      NULL,
    [OperId]     INT      NULL,
    [OriginalID] INT      NULL,
    CONSTRAINT [PK_CardMZT2] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CardMZT2_CardMZ] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[CardMZ] ([Id]) ON DELETE CASCADE
);

