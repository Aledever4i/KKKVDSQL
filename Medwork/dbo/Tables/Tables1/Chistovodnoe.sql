CREATE TABLE [dbo].[Chistovodnoe] (
    [ID]          INT           NOT NULL,
    [PatID]       INT           NULL,
    [Nomer]       NVARCHAR (50) NULL,
    [DiagDict]    NVARCHAR (50) NULL,
    [DiagCode]    NVARCHAR (6)  NULL,
    [Vrach]       INT           NULL,
    [DataVidachi] DATETIME      NULL,
    [DataZaezda]  DATETIME      NULL,
    CONSTRAINT [ChistovodnoePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ChistovodnoeToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

