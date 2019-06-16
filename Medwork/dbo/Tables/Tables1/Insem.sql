CREATE TABLE [dbo].[Insem] (
    [Id]              INT            NOT NULL,
    [DocTypeId]       INT            NULL,
    [MasterID]        INT            NULL,
    [ExecDate]        DATETIME       NULL,
    [DonorNum]        NVARCHAR (20)  NULL,
    [Fresh]           BIT            NULL,
    [TESA]            BIT            NULL,
    [GotTime]         DATETIME       NULL,
    [LiqTime]         FLOAT (53)     NULL,
    [Lost]            BIT            NULL,
    [Volume]          FLOAT (53)     NULL,
    [ClamId]          INT            NULL,
    [ProdMethodId]    INT            NULL,
    [a1]              VARCHAR (150)  NULL,
    [a2]              VARCHAR (150)  NULL,
    [a3]              VARCHAR (150)  NULL,
    [b1]              VARCHAR (150)  NULL,
    [b2]              VARCHAR (150)  NULL,
    [b3]              VARCHAR (150)  NULL,
    [c1]              FLOAT (53)     NULL,
    [c2]              FLOAT (53)     NULL,
    [c3]              FLOAT (53)     NULL,
    [IVolume]         FLOAT (53)     NULL,
    [SpOo]            FLOAT (53)     NULL,
    [ITime]           DATETIME       NULL,
    [ToITime]         FLOAT (53)     NULL,
    [OperId]          INT            NULL,
    [OriginalID]      INT            NULL,
    [PartnerFullName] NVARCHAR (100) NULL,
    CONSTRAINT [PK_Insem] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Insem_ECFEmbr] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ECFEmbr] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idxInsem_MasterID_Tesa]
    ON [dbo].[Insem]([MasterID] ASC, [TESA] ASC);

