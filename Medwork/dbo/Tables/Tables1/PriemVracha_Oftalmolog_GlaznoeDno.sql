CREATE TABLE [dbo].[PriemVracha_Oftalmolog_GlaznoeDno] (
    [ID]          INT   NOT NULL,
    [PatID]       INT   NULL,
    [DZNOD]       NTEXT NULL,
    [DZNOS]       NTEXT NULL,
    [SosudiOD]    NTEXT NULL,
    [SosudiOS]    NTEXT NULL,
    [MakulaOD]    NTEXT NULL,
    [MakulaOS]    NTEXT NULL,
    [PerefiriaOD] NTEXT NULL,
    [PerefiriaOS] NTEXT NULL,
    CONSTRAINT [PriemVracha_Oftalmolog_GlaznoeDnoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Oftalmolog_GlaznoeDnoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

