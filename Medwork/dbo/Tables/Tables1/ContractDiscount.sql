CREATE TABLE [dbo].[ContractDiscount] (
    [ID]              INT           NOT NULL,
    [DiscountPercent] FLOAT (53)    NULL,
    [BeginDate]       DATETIME      NULL,
    [EndDate]         DATETIME      NULL,
    [DiscountType]    NVARCHAR (10) NULL,
    [MasterID]        INT           NULL,
    CONSTRAINT [ContractDiscountPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ContractDiscountToContracts] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Contracts] ([ID]) ON DELETE CASCADE
);

