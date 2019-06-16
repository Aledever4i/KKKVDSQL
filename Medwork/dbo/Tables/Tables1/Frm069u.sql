CREATE TABLE [dbo].[Frm069u] (
    [ID]            INT            NOT NULL,
    [MasterID]      INT            NULL,
    [Автор]         INT            NULL,
    [PatId]         INT            NULL,
    [CardNum]       INT            NULL,
    [Дата]          DATETIME       NULL,
    [Obezbolivanie] NVARCHAR (100) NULL,
    [Opisanie]      NTEXT          NULL,
    [Doctor]        INT            NULL,
    [Sestra]        NVARCHAR (50)  NULL,
    [Diagnoz]       NVARCHAR (100) NULL,
    [Age]           NVARCHAR (15)  NULL,
    [LastName]      NVARCHAR (50)  NULL,
    [FirstName]     NVARCHAR (50)  NULL,
    [SecondName]    NVARCHAR (50)  NULL,
    [Birthdate]     DATETIME       NULL,
    CONSTRAINT [Frm069uPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

