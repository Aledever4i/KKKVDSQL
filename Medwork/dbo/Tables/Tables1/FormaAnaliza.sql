CREATE TABLE [dbo].[FormaAnaliza] (
    [ID]              INT            NOT NULL,
    [PatID]           INT            NULL,
    [MasterID]        INT            NULL,
    [NazvanieAnaliza] NVARCHAR (100) NULL,
    [Kolichestvo]     FLOAT (53)     NULL,
    [Razmernost]      NVARCHAR (10)  NULL,
    CONSTRAINT [FormaAnalizaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FormaAnalizaToDrugieAnalizi] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[DrugieAnalizi] ([ID]) ON DELETE CASCADE
);

