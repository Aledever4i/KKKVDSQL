CREATE TABLE [dbo].[MazkiNaOnkologiyu] (
    [ID]                     INT          NOT NULL,
    [PatID]                  INT          NULL,
    [NomerAnaliza]           INT          NULL,
    [DataProvedeniyaAnaliza] DATETIME     NULL,
    [DataPoslednegoMensi]    DATETIME     NULL,
    [VozrastnayaNorma]       NVARCHAR (1) NULL,
    [ElementiVospaleniya]    NVARCHAR (1) NULL,
    [DisplaziyaEpiteliya]    INT          NULL,
    [Cancer]                 NVARCHAR (1) NULL,
    [Vrach]                  INT          NULL,
    CONSTRAINT [MazkiNaOnkologiyuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [MazkiNaOnkologiyuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

