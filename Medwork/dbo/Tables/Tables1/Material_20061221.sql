CREATE TABLE [dbo].[Material_20061221] (
    [ID]            INT             NOT NULL,
    [MasterID]      INT             NULL,
    [FullName]      NVARCHAR (1024) NULL,
    [Code]          NVARCHAR (12)   NULL,
    [NodeType]      NVARCHAR (12)   NULL,
    [KeyWord]       NVARCHAR (255)  NULL,
    [Actual]        BIT             NULL,
    [Primechanie]   NTEXT           NULL,
    [Price]         FLOAT (53)      NULL,
    [CurrencyPrice] FLOAT (53)      NULL,
    [Measure]       NVARCHAR (50)   NULL,
    [PackMeasure]   NVARCHAR (50)   NULL,
    [PackQuant]     FLOAT (53)      NULL,
    [PackRest]      INT             NULL,
    [Rest]          INT             NULL,
    [StavkaNDS]     INT             NULL
);

