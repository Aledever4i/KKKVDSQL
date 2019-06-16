﻿CREATE TABLE [dbo].[PriemVracha_Kardiologa] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [PriemVracha_KardiologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_KardiologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

