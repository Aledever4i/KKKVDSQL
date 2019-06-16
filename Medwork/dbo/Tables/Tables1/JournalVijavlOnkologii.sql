CREATE TABLE [dbo].[JournalVijavlOnkologii] (
    [ID]             INT            NOT NULL,
    [MasterID]       INT            NULL,
    [Автор]          INT            NULL,
    [SecondName]     NVARCHAR (50)  NULL,
    [PatId]          INT            NULL,
    [CardNum]        INT            NULL,
    [Дата]           DATETIME       NULL,
    [LastName]       NVARCHAR (50)  NULL,
    [FirstName]      NVARCHAR (50)  NULL,
    [Diagnoz]        NVARCHAR (100) NULL,
    [BirthDate]      DATETIME       NULL,
    [DataVijavlenie] DATETIME       NULL,
    [OtdalenResult]  NVARCHAR (100) NULL,
    [Diagnoz1]       NVARCHAR (100) NULL,
    CONSTRAINT [JournalVijavlOnkologiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

