CREATE TABLE [dbo].[DispNabl] (
    [ID]            INT            NOT NULL,
    [MasterID]      INT            NULL,
    [Автор]         INT            NULL,
    [Дата]          DATETIME       NULL,
    [PatId]         INT            NULL,
    [CardNum]       INT            NULL,
    [Primechanie]   NTEXT          NULL,
    [ShifrDogovora] NVARCHAR (50)  NULL,
    [LastName]      NVARCHAR (50)  NULL,
    [FirstName]     NVARCHAR (50)  NULL,
    [SecondName]    NVARCHAR (50)  NULL,
    [Birthdate]     DATETIME       NULL,
    [PatAddress]    NVARCHAR (100) NULL,
    [Section]       NVARCHAR (2)   NULL,
    CONSTRAINT [DispNablPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

