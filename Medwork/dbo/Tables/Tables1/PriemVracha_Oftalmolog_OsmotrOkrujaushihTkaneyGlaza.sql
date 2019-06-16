CREATE TABLE [dbo].[PriemVracha_Oftalmolog_OsmotrOkrujaushihTkaneyGlaza] (
    [ID]                 INT   NOT NULL,
    [PatID]              INT   NULL,
    [OkrujaushieTkaniOD] NTEXT NULL,
    [PolojenieGlazaOD]   NTEXT NULL,
    [DvijenieGlazaOD]    NTEXT NULL,
    [VekiOD]             NTEXT NULL,
    [VekiOS]             NTEXT NULL,
    [DvijenieGlazaOS]    NTEXT NULL,
    [PolojenieGlazaOS]   NTEXT NULL,
    [OkrujaushieTkaniOS] NTEXT NULL,
    [SleznyeOrganyOD1]   NTEXT NULL,
    [SleznyeOrganyOS1]   NTEXT NULL,
    CONSTRAINT [PriemVracha_Oftalmolog_OsmotrOkrujaushihTkaneyGlazaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Oftalmolog_OsmotrOkrujaushihTkaneyGlazaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

