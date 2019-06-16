CREATE TABLE [dbo].[PriemVracha_Ortopedatravmatolog_Plantografia] (
    [ID]                 INT   NOT NULL,
    [PatID]              INT   NULL,
    [plantometria_image] IMAGE NULL,
    CONSTRAINT [PriemVracha_Ortopedatravmatolog_PlantografiaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Ortopedatravmatolog_PlantografiaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

