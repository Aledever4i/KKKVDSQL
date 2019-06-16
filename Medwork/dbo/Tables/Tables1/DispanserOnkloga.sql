CREATE TABLE [dbo].[DispanserOnkloga] (
    [ID]         INT            NOT NULL,
    [MasterID]   INT            NULL,
    [Автор]      INT            NULL,
    [PatId]      INT            NULL,
    [CardNum]    INT            NULL,
    [LastName]   NVARCHAR (50)  NULL,
    [FirstName]  NVARCHAR (50)  NULL,
    [SecondName] NVARCHAR (50)  NULL,
    [Дата]       DATETIME       NULL,
    [Diagnoz]    NVARCHAR (100) NULL,
    [PlanDate]   DATETIME       NULL,
    [Uchastok]   NVARCHAR (2)   NULL,
    [Section]    NVARCHAR (2)   NULL,
    CONSTRAINT [DispanserOnklogaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

