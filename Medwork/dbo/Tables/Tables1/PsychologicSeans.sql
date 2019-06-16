CREATE TABLE [dbo].[PsychologicSeans] (
    [ID]         INT           NOT NULL,
    [MasterID]   INT           NULL,
    [PatId]      INT           NULL,
    [CardNum]    INT           NULL,
    [Дата]       DATETIME      NULL,
    [Автор]      INT           NULL,
    [LastName]   NVARCHAR (50) NULL,
    [FirstName]  NVARCHAR (50) NULL,
    [SecondName] NVARCHAR (50) NULL,
    [BirthDate]  DATETIME      NULL,
    [Result]     NTEXT         NULL,
    CONSTRAINT [PsychologicSeansPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

