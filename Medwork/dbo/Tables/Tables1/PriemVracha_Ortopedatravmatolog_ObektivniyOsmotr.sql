CREATE TABLE [dbo].[PriemVracha_Ortopedatravmatolog_ObektivniyOsmotr] (
    [ID]              INT   NOT NULL,
    [PatID]           INT   NULL,
    [VizualniyOsmotr] NTEXT NULL,
    [SvodyStop]       NTEXT NULL,
    [Sustavy]         NTEXT NULL,
    CONSTRAINT [PriemVracha_Ortopedatravmatolog_ObektivniyOsmotrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Ortopedatravmatolog_ObektivniyOsmotrToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

