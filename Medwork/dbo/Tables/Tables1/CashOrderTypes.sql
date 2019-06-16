CREATE TABLE [dbo].[CashOrderTypes] (
    [ID]       INT           NOT NULL,
    [TypeName] NVARCHAR (50) NULL,
    [Debit]    BIT           NULL,
    CONSTRAINT [CashOrderTypesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

