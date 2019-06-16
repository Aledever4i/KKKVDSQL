CREATE TABLE [dbo].[Lawyer] (
    [ID]         INT            NOT NULL,
    [MasterID]   INT            NULL,
    [CardNum]    INT            NULL,
    [PatAddr]    NVARCHAR (100) NULL,
    [PatPhone]   NVARCHAR (50)  NULL,
    [Purpose]    NVARCHAR (50)  NULL,
    [Result]     NVARCHAR (50)  NULL,
    [LastName]   NVARCHAR (50)  NULL,
    [FirstName]  NVARCHAR (50)  NULL,
    [SecondName] NVARCHAR (50)  NULL,
    [Дата]       DATETIME       NULL,
    [Автор]      INT            NULL,
    [PatId]      INT            NULL,
    CONSTRAINT [LawyerPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

