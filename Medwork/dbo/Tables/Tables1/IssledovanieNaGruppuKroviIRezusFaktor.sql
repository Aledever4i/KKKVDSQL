CREATE TABLE [dbo].[IssledovanieNaGruppuKroviIRezusFaktor] (
    [GruppaKrovi] NVARCHAR (50) NULL,
    [RezusFaktor] NVARCHAR (50) NULL,
    [ID]          INT           NULL,
    [PatID]       INT           NULL,
    CONSTRAINT [IssledovanieNaGruppuKroviIRezusFaktorToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

