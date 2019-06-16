CREATE TABLE [dbo].[ProfosmotrFactors] (
    [ID]           INT           NOT NULL,
    [NaborUslugID] NVARCHAR (50) NULL,
    [Code]         NVARCHAR (50) NULL,
    [FactorName]   NTEXT         NULL,
    [NodeType]     NVARCHAR (50) NULL,
    [MasterID]     INT           NULL,
    CONSTRAINT [ProfosmotrFactorsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

