CREATE TABLE [dbo].[Plomba] (
    [ID]              INT           NOT NULL,
    [MasterID]        INT           NULL,
    [PatId]           INT           NULL,
    [SecondName]      NVARCHAR (50) NULL,
    [LastName]        NVARCHAR (50) NULL,
    [CardNum]         INT           NULL,
    [FirstName]       NVARCHAR (50) NULL,
    [ToothNum]        INT           NULL,
    [PlombCount]      INT           NULL,
    [PlombType]       INT           NULL,
    [Material]        NVARCHAR (50) NULL,
    [Prokladka]       NVARCHAR (50) NULL,
    [Anestetiki]      NVARCHAR (50) NULL,
    [ShtiftiAnkernie] NVARCHAR (50) NULL,
    [Дата]            DATETIME      NULL,
    [Автор]           INT           NULL,
    CONSTRAINT [PlombaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

