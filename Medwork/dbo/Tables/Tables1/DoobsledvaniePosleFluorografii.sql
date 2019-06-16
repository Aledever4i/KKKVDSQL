CREATE TABLE [dbo].[DoobsledvaniePosleFluorografii] (
    [ID]             INT            NOT NULL,
    [MasterID]       INT            NULL,
    [Автор]          INT            NULL,
    [SecondName]     NVARCHAR (50)  NULL,
    [PatId]          NVARCHAR (50)  NULL,
    [CardNum]        INT            NULL,
    [Дата]           DATETIME       NULL,
    [LastName]       NVARCHAR (50)  NULL,
    [FirstName]      NVARCHAR (50)  NULL,
    [PatAddress]     NVARCHAR (100) NULL,
    [Diagnoz]        NVARCHAR (100) NULL,
    [BirthDate]      DATETIME       NULL,
    [DataVijavlenie] DATETIME       NULL,
    [Result]         NVARCHAR (100) NULL,
    CONSTRAINT [DoobsledvaniePosleFluorografiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

