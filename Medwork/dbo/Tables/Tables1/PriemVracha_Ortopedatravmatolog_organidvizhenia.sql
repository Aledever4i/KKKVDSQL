CREATE TABLE [dbo].[PriemVracha_Ortopedatravmatolog_organidvizhenia] (
    [ID]                            INT           NOT NULL,
    [PatID]                         INT           NULL,
    [Sustavi]                       NVARCHAR (50) NULL,
    [VerhnieKonechnosty]            NTEXT         NULL,
    [NizhnieKonechnosty]            NTEXT         NULL,
    [sustavimemo]                   NTEXT         NULL,
    [obshiystatusorganovdvizheniya] NTEXT         NULL,
    CONSTRAINT [PriemVracha_Ortopedatravmatolog_organidvizheniaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Ortopedatravmatolog_organidvizheniaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

