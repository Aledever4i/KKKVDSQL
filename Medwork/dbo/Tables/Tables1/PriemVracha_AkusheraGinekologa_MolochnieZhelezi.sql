CREATE TABLE [dbo].[PriemVracha_AkusheraGinekologa_MolochnieZhelezi] (
    [ID]              INT   NOT NULL,
    [PatID]           INT   NULL,
    [molochniejelezi] NTEXT NULL,
    CONSTRAINT [PriemVracha_AkusheraGinekologa_MolochnieZheleziPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_AkusheraGinekologa_MolochnieZheleziToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

