CREATE TABLE [dbo].[FinanceSourceTypes] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [Descr]              VARCHAR (100) NOT NULL,
    [IsStatTalonVisible] BIT           CONSTRAINT [DF_FinanceSourceTypes_IsStatTalonVisible] DEFAULT ((0)) NOT NULL
);

