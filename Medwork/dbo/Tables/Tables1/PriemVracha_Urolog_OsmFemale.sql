CREATE TABLE [dbo].[PriemVracha_Urolog_OsmFemale] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [npotipich]        NVARCHAR (50) NULL,
    [npotipichmemo]    NTEXT         NULL,
    [Obrazovaniya]     NVARCHAR (1)  NULL,
    [ObrazovaniyaMemo] NTEXT         NULL,
    [nouretri]         NTEXT         NULL,
    CONSTRAINT [PriemVracha_Urolog_OsmFemalePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Urolog_OsmFemaleToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

