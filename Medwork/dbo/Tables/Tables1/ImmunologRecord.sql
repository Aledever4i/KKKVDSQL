CREATE TABLE [dbo].[ImmunologRecord] (
    [ID]          INT            NOT NULL,
    [MasterID]    INT            NULL,
    [Автор]       INT            NULL,
    [PatId]       INT            NULL,
    [CardNum]     INT            NULL,
    [LastName]    NVARCHAR (50)  NULL,
    [FirstName]   NVARCHAR (50)  NULL,
    [SecondName]  NVARCHAR (50)  NULL,
    [Дата]        DATETIME       NULL,
    [Age]         NVARCHAR (15)  NULL,
    [Address]     NVARCHAR (100) NULL,
    [MestoRaboti] NVARCHAR (50)  NULL,
    [Dolzhnost]   NVARCHAR (50)  NULL,
    [Kontingent]  INT            NULL,
    [Diagnoz]     NVARCHAR (100) NULL,
    CONSTRAINT [ImmunologRecordPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

