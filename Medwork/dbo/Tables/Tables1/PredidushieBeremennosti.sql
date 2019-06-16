CREATE TABLE [dbo].[PredidushieBeremennosti] (
    [ID]                      INT           NOT NULL,
    [PatID]                   INT           NULL,
    [MasterID]                INT           NULL,
    [RodiAbort]               NVARCHAR (50) NULL,
    [Data]                    DATETIME      NULL,
    [Oslozhneniya]            NVARCHAR (50) NULL,
    [OperativniePosobiya]     NVARCHAR (50) NULL,
    [MassaVesNovorozhdennogo] INT           NULL,
    CONSTRAINT [PredidushieBeremennostiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PredidushieBeremennostiToAnamnez] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Anamnez] ([ID]) ON DELETE CASCADE
);

