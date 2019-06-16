CREATE TABLE [dbo].[FR_Tax] (
    [ID]    INT           NOT NULL,
    [Code]  INT           NULL,
    [Name]  NVARCHAR (40) NULL,
    [Value] INT           NULL,
    CONSTRAINT [FR_TaxPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

