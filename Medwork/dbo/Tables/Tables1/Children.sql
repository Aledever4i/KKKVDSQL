CREATE TABLE [dbo].[Children] (
    [Id]                     INT           NOT NULL,
    [DocTypeId]              INT           NULL,
    [MasterID]               INT           NULL,
    [ExecDate]               DATETIME      NULL,
    [SexId]                  INT           NULL,
    [Weight]                 FLOAT (53)    NULL,
    [Height]                 FLOAT (53)    NULL,
    [Apgar]                  FLOAT (53)    NULL,
    [Evolution]              NTEXT         NULL,
    [OperId]                 INT           NULL,
    [OriginalID]             INT           NULL,
    [Photo1Id]               IMAGE         NULL,
    [Photo2Id]               IMAGE         NULL,
    [Photo3Id]               IMAGE         NULL,
    [Complications]          NTEXT         NULL,
    [ZdorovieRebyonka]       NTEXT         NULL,
    [ZdorovieRebyonkaVNorme] NVARCHAR (1)  NULL,
    [Poroki]                 NVARCHAR (1)  NULL,
    [VrojdeniePoroki]        NVARCHAR (50) NULL,
    CONSTRAINT [PK_Children] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Children_ECFResult] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ECFResult] ([Id]) ON DELETE CASCADE
);

