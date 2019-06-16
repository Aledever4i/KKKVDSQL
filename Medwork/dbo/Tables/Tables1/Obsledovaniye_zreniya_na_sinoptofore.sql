CREATE TABLE [dbo].[Obsledovaniye_zreniya_na_sinoptofore] (
    [ID]                      INT NOT NULL,
    [PatID]                   INT NULL,
    [sinoptofor_objectiv_OD]  INT NULL,
    [sinoptofor_subjectiv_OD] INT NULL,
    [sinoptofor_fusional_OD]  INT NULL,
    [sinoptofor_objectiv_OS]  INT NULL,
    [sinoptofor_subjectiv_OS] INT NULL,
    [sinoptofor_fusional_OS]  INT NULL,
    CONSTRAINT [Obsledovaniye_zreniya_na_sinoptoforePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Obsledovaniye_zreniya_na_sinoptoforeToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

