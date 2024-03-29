﻿CREATE TABLE [dbo].[StorageOperations] (
    [ID]                INT            NOT NULL,
    [MasterID]          INT            NULL,
    [Quantity]          MONEY          NULL,
    [Comment]           VARCHAR (2000) NULL,
    [Article]           INT            NULL,
    [Author]            INT            NULL,
    [CreateDate]        DATETIME       NULL,
    [ReservedField]     NVARCHAR (50)  NULL,
    [NomenclatureLine]  INT            NULL,
    [Series]            NVARCHAR (50)  NULL,
    [Barcode]           NVARCHAR (50)  NULL,
    [QuantityPartition] INT            NULL,
    [TaxRate]           FLOAT (53)     NULL,
    [PurchasingPrice]   MONEY          NULL,
    [UseDate]           DATETIME       NULL,
    [Position]          NVARCHAR (50)  NULL,
    [RealRest]          MONEY          NULL,
    [MaterialStr]       NVARCHAR (255) NULL,
    [RetailPrice]       MONEY          NULL,
    [DiscountPercent]   FLOAT (53)     NULL,
    [SumNDS]            MONEY          NULL,
    [SumPos]            MONEY          NULL,
    [NacenkaPN]         MONEY          NULL,
    [InputDate]         DATETIME       NULL,
    [ServGUID]          NVARCHAR (32)  NULL,
    [PriceWithNDS]      MONEY          NULL,
    [NakladnieRashodi]  MONEY          NULL,
    [NDS]               MONEY          NULL,
    [Request_quantity]  MONEY          NULL,
    CONSTRAINT [StorageOperationsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [StorageOperationsToStorageDocument] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[StorageDocument] ([ID]) ON DELETE CASCADE
);

