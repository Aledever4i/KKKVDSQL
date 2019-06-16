CREATE TABLE [dbo].[Gyn1AppHist] (
    [Id]         INT           NOT NULL,
    [DocTypeId]  INT           NULL,
    [MasterID]   INT           NULL,
    [ExecDate]   DATETIME      NULL,
    [Place]      VARCHAR (255) NULL,
    [Method]     VARCHAR (255) NULL,
    [QtyO]       INT           NULL,
    [QtyE]       INT           NULL,
    [QtyCryo]    INT           NULL,
    [Preg]       BIT           NULL,
    [Res]        NTEXT         NULL,
    [Stim]       NTEXT         NULL,
    [OperId]     INT           NULL,
    [OriginalID] INT           NULL,
    CONSTRAINT [PK_Gyn1AppHist] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Gyn1AppHist_Gyn1App] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Gyn1App] ([Id]) ON DELETE CASCADE
);

