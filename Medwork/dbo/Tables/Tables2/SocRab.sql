CREATE TABLE [dbo].[SocRab] (
    [ID]         INT           NOT NULL,
    [MasterID]   INT           NULL,
    [CardNum]    INT           NULL,
    [LastName]   NVARCHAR (50) NULL,
    [FirstName]  NVARCHAR (50) NULL,
    [SecondName] NVARCHAR (50) NULL,
    [PatAddr]    NVARCHAR (50) NULL,
    [PatPhone]   NVARCHAR (50) NULL,
    [Purpose]    NVARCHAR (50) NULL,
    [Result]     NVARCHAR (50) NULL,
    [Дата]       DATETIME      NULL,
    [Автор]      INT           NULL,
    [PatId]      INT           NULL,
    CONSTRAINT [SocRabPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

