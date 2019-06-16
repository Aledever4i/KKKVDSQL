CREATE TABLE [dbo].[UslugiTap] (
    [ID]          INT            NOT NULL,
    [PatID]       INT            NULL,
    [MasterID]    INT            NULL,
    [Service]     NVARCHAR (50)  NULL,
    [ServiceName] NVARCHAR (255) NULL,
    [Quant]       INT            NULL,
    [PaymentType] INT            NULL,
    [MainService] BIT            NULL,
    [GUID]        VARCHAR (32)   NULL,
    [kateg]       NVARCHAR (100) NULL,
    [Plomba]      BIT            NULL,
    [UET]         FLOAT (53)     NULL,
    [Price]       MONEY          NULL,
    [PaymentCode] INT            NULL,
    CONSTRAINT [UslugiTapPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UslugiTapToTAP] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[TAP] ([ID]) ON DELETE CASCADE
);

