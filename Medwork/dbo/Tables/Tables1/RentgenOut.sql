CREATE TABLE [dbo].[RentgenOut] (
    [ID]            INT            NOT NULL,
    [MasterID]      INT            NULL,
    [Автор]         INT            NULL,
    [PatId]         INT            NULL,
    [CardNum]       INT            NULL,
    [LastName]      NVARCHAR (50)  NULL,
    [FirstName]     NVARCHAR (50)  NULL,
    [SecondName]    NVARCHAR (50)  NULL,
    [Дата]          DATETIME       NULL,
    [Birthdate]     DATETIME       NULL,
    [NomeraSnimkov] NVARCHAR (100) NULL,
    CONSTRAINT [RentgenOutPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

