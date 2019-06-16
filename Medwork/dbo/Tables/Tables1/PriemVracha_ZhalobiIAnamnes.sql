CREATE TABLE [dbo].[PriemVracha_ZhalobiIAnamnes] (
    [ID]              INT   NOT NULL,
    [PatID]           INT   NULL,
    [AnamnesisiMorbi] NTEXT NULL,
    [Zhalobi]         NTEXT NULL,
    CONSTRAINT [PriemVracha_ZhalobiIAnamnesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_ZhalobiIAnamnesToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

