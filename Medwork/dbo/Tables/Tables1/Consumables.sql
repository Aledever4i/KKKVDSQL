CREATE TABLE [dbo].[Consumables] (
    [ID]          INT             NOT NULL,
    [MasterID]    INT             NULL,
    [MaterialID]  INT             NULL,
    [CostType]    INT             NULL,
    [CostName]    NVARCHAR (100)  NULL,
    [Quant]       NUMERIC (10, 5) NULL,
    [Price]       NUMERIC (10, 5) NULL,
    [DateS]       DATETIME        NULL,
    [DateE]       DATETIME        NULL,
    [ServiceCode] NVARCHAR (20)   NULL,
    [ServiceType] INT             NULL,
    CONSTRAINT [ConsumablesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ConsumablesToPaidService] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PaidService] ([ID]) ON DELETE CASCADE
);

