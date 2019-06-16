CREATE TABLE [dbo].[ServiceQuantity] (
    [ID]              INT           NOT NULL,
    [ServiceCode]     NVARCHAR (20) NULL,
    [QuantityMaximum] INT           NULL,
    CONSTRAINT [ServiceQuantityPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

