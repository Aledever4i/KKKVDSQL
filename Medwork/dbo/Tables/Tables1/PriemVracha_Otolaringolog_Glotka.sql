CREATE TABLE [dbo].[PriemVracha_Otolaringolog_Glotka] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [vkuscombo]                NVARCHAR (50) NULL,
    [Vkus]                     NTEXT         NULL,
    [predveriertamemo]         NTEXT         NULL,
    [SlizistayaObolochkalotka] NTEXT         NULL,
    [Polostrtayasikmemo]       NTEXT         NULL,
    [nebnieduzhkimemo]         NTEXT         NULL,
    [nebniemindalinimemo]      NTEXT         NULL,
    [zadnayastenkamemo]        NTEXT         NULL,
    [predveriertacombo]        NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_Otolaringolog_GlotkaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Otolaringolog_GlotkaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

