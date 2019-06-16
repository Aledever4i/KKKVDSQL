CREATE TABLE [dbo].[CostTypes] (
    [ID]       INT            NOT NULL,
    [CostName] NVARCHAR (100) NULL,
    [Code]     NVARCHAR (10)  NULL,
    CONSTRAINT [CostTypesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

