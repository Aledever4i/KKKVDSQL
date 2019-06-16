CREATE TABLE [dbo].[ServiceTariff] (
    [ID]          INT           NOT NULL,
    [Code]        NVARCHAR (50) NULL,
    [BasePrice]   FLOAT (53)    NULL,
    [Year]        INT           NULL,
    [Month]       INT           NULL,
    [ServiceName] NVARCHAR (50) NULL,
    CONSTRAINT [ServiceTariffPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

