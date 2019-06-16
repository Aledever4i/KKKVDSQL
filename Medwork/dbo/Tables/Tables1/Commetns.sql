CREATE TABLE [dbo].[Commetns] (
    [Data]           DATETIME      NULL,
    [Avtor]          NVARCHAR (50) NULL,
    [Kommentariy]    NTEXT         NULL,
    [ID]             INT           NULL,
    [MasterID]       INT           NULL,
    [PatID]          INT           NULL,
    [Dokument]       NVARCHAR (50) NULL,
    [Prislan]        DATETIME      NULL,
    [Nomer]          NVARCHAR (50) NULL,
    [Organizatsiya]  NVARCHAR (50) NULL,
    [ZanesenoVKartu] NVARCHAR (50) NULL,
    [DonePerson]     NVARCHAR (50) NULL,
    [DeystvuetDo]    DATETIME      NULL,
    [DocTypeGUID]    NVARCHAR (32) NULL,
    [DocImage]       IMAGE         NULL,
    [Seriya]         NVARCHAR (10) NULL,
    CONSTRAINT [CommetnsToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [CommetnsToPatient] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Patient] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IdxCommetnsNomer]
    ON [dbo].[Commetns]([Nomer] ASC);

