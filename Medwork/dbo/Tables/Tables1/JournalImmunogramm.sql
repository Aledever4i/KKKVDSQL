CREATE TABLE [dbo].[JournalImmunogramm] (
    [ID]           INT           NOT NULL,
    [MasterID]     INT           NULL,
    [Immunogramma] NTEXT         NULL,
    [Автор]        INT           NULL,
    [PatId]        INT           NULL,
    [CardNum]      INT           NULL,
    [Дата]         DATETIME      NULL,
    [LastName]     NVARCHAR (50) NULL,
    [FirstName]    NVARCHAR (50) NULL,
    [SecondName]   NVARCHAR (50) NULL,
    [Sdal]         NVARCHAR (3)  NULL,
    [Rezultat]     NVARCHAR (3)  NULL,
    CONSTRAINT [JournalImmunogrammPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

