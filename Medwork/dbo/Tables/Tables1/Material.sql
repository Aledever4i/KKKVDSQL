CREATE TABLE [dbo].[Material] (
    [ID]              INT            NOT NULL,
    [FullName]        NVARCHAR (100) NOT NULL,
    [TradeName]       NVARCHAR (100) NULL,
    [WorldName]       NVARCHAR (100) NULL,
    [Unit]            INT            NULL,
    [Form]            INT            NULL,
    [Pack]            NVARCHAR (20)  NULL,
    [Dosage]          NVARCHAR (20)  NULL,
    [Producer]        NVARCHAR (100) NULL,
    [QuantPerPlace]   INT            NULL,
    [Fraction]        INT            NULL,
    [RestRate]        INT            NULL,
    [Rest]            MONEY          NULL,
    [NodeType]        NVARCHAR (6)   NULL,
    [Parent]          INT            NULL,
    [Kind]            INT            NULL,
    [Type]            INT            NULL,
    [Comment]         NVARCHAR (200) NULL,
    [EnabledLevel]    TINYINT        NULL,
    [Note]            NVARCHAR (250) NULL,
    [Storage]         INT            NULL,
    [CreateDate]      DATETIME       NULL,
    [OperationId]     INT            NULL,
    [Reserved]        INT            NULL,
    [MaterialCode]    NVARCHAR (50)  NULL,
    [Price]           MONEY          NULL,
    [RetailPrice]     MONEY          NULL,
    [RestBelowLimit]  VARCHAR (1)    NULL,
    [Nacenka]         MONEY          NULL,
    [CalcPriceMethod] INT            NULL,
    [Series]          NVARCHAR (50)  NULL,
    CONSTRAINT [NomenclaturePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FullName]
    ON [dbo].[Material]([FullName] ASC);


GO
CREATE NONCLUSTERED INDEX [CurrentRest]
    ON [dbo].[Material]([Rest] ASC);

