CREATE TABLE [dbo].[PriemVracha_Oftalmolog_IssledovaniaStereozrenia] (
    [cylOD]  FLOAT (53) NULL,
    [sphOD]  FLOAT (53) NULL,
    [sphOS]  FLOAT (53) NULL,
    [AxOD]   FLOAT (53) NULL,
    [cylOS]  FLOAT (53) NULL,
    [AxOS]   FLOAT (53) NULL,
    [bezkor] FLOAT (53) NULL,
    [skor]   FLOAT (53) NULL,
    [id]     INT        NOT NULL,
    [PatID]  INT        NOT NULL,
    CONSTRAINT [PriemVracha_Oftalmolog_IssledovaniaStereozreniaToPatForm] FOREIGN KEY ([id]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

