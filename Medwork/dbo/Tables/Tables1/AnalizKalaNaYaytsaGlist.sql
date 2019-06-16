CREATE TABLE [dbo].[AnalizKalaNaYaytsaGlist] (
    [ID]                     INT          NOT NULL,
    [PatID]                  INT          NULL,
    [NomerAnaliza]           INT          NULL,
    [DataProvedeniyaAnaliza] DATETIME     NULL,
    [Opistorhoz]             NVARCHAR (1) NULL,
    [Askaridi]               INT          NULL,
    [Ostritsi]               INT          NULL,
    [Vrach]                  INT          NULL,
    CONSTRAINT [AnalizKalaNaYaytsaGlistPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizKalaNaYaytsaGlistToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

