CREATE TABLE [dbo].[OperProkt] (
    [ID]                INT           NOT NULL,
    [MasterID]          INT           NULL,
    [Автор]             INT           NULL,
    [LastName]          NVARCHAR (50) NULL,
    [PatId]             INT           NULL,
    [CardNum]           INT           NULL,
    [FirstName]         NVARCHAR (50) NULL,
    [SecondName]        NVARCHAR (50) NULL,
    [Дата]              DATETIME      NULL,
    [Nomer]             INT           NULL,
    [NazvanieOperatsii] NVARCHAR (50) NULL,
    [PatAddress]        NVARCHAR (50) NULL,
    [Protokol]          NTEXT         NULL,
    CONSTRAINT [OperProktPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

