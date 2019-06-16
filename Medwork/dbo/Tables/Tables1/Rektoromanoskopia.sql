CREATE TABLE [dbo].[Rektoromanoskopia] (
    [ID]          INT           NOT NULL,
    [MasterID]    INT           NULL,
    [Автор]       INT           NULL,
    [LastName]    NVARCHAR (50) NULL,
    [PatId]       INT           NULL,
    [CardNum]     INT           NULL,
    [FirstName]   NVARCHAR (50) NULL,
    [SecondName]  NVARCHAR (50) NULL,
    [Дата]        DATETIME      NULL,
    [Kontingent]  INT           NULL,
    [Rezultat]    NTEXT         NULL,
    [Naznachenie] NTEXT         NULL,
    CONSTRAINT [RektoromanoskopiaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

