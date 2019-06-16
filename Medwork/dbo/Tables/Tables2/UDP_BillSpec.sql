CREATE TABLE [dbo].[UDP_BillSpec] (
    [ID]             INT            NOT NULL,
    [Doctor]         INT            NULL,
    [Quant]          INT            NULL,
    [Summa]          MONEY          NULL,
    [Diag]           NVARCHAR (15)  NULL,
    [Service]        NVARCHAR (50)  NULL,
    [Price]          MONEY          NULL,
    [MasterID]       INT            NULL,
    [ServiceName]    NVARCHAR (255) NULL,
    [CardNum]        NVARCHAR (50)  NULL,
    [PatID]          INT            NULL,
    [PDate]          DATETIME       NULL,
    [DiscontPassive] FLOAT (53)     NULL,
    [GUID]           NVARCHAR (32)  NULL,
    [LetNum]         NVARCHAR (250) NULL,
    [LetDate]        DATETIME       NULL,
    [Policy]         NVARCHAR (100) NULL,
    CONSTRAINT [UDP_BillSpecPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UDP_BillSpecToUDP_Bill] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[UDP_Bill] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [UDP_BillSpec_MasterId_PatId]
    ON [dbo].[UDP_BillSpec]([MasterID] ASC, [PatID] ASC);


GO
CREATE NONCLUSTERED INDEX [UDP_BillSpec_GUID_idx]
    ON [dbo].[UDP_BillSpec]([GUID] ASC);

