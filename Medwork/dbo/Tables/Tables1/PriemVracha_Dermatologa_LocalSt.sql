CREATE TABLE [dbo].[PriemVracha_Dermatologa_LocalSt] (
    [ID]                     INT   NOT NULL,
    [PatID]                  INT   NULL,
    [VidimieSlizistie]       NTEXT NULL,
    [SostoyanieNogtey]       NTEXT NULL,
    [VolosistayaChastGolovi] NTEXT NULL,
    [StatusSpecilismemo]     NTEXT NULL,
    CONSTRAINT [PriemVracha_Dermatologa_LocalStPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Dermatologa_LocalStToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

