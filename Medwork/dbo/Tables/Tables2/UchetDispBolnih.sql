CREATE TABLE [dbo].[UchetDispBolnih] (
    [ID]         INT            NOT NULL,
    [MasterID]   INT            NULL,
    [PatId]      NVARCHAR (50)  NULL,
    [CardNum]    INT            NULL,
    [LastName]   NVARCHAR (50)  NULL,
    [FirstName]  NVARCHAR (50)  NULL,
    [SecondName] NVARCHAR (50)  NULL,
    [PatAddress] NVARCHAR (100) NULL,
    [Diagnoz]    NVARCHAR (100) NULL,
    [Дата]       DATETIME       NULL,
    [Автор]      INT            NULL,
    [PsArtrit]   NVARCHAR (50)  NULL,
    [PASIindex]  NVARCHAR (50)  NULL,
    [VnutOrgan]  NTEXT          NULL,
    [Inval]      NVARCHAR (50)  NULL,
    CONSTRAINT [UchetDispBolnihPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

