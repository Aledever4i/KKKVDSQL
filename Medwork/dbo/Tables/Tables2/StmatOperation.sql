CREATE TABLE [dbo].[StmatOperation] (
    [ID]                     INT            NOT NULL,
    [MasterID]               INT            NULL,
    [Автор]                  INT            NULL,
    [LastName]               NVARCHAR (50)  NULL,
    [PatId]                  INT            NULL,
    [CardNum]                INT            NULL,
    [FirstName]              NVARCHAR (50)  NULL,
    [SecondName]             NVARCHAR (50)  NULL,
    [Дата]                   DATETIME       NULL,
    [Rezultat]               NTEXT          NULL,
    [BirthDate]              DATETIME       NULL,
    [Diagnoz]                NVARCHAR (100) NULL,
    [GistologicheskiyOtchet] NTEXT          NULL,
    [OperType]               NVARCHAR (20)  NULL,
    CONSTRAINT [StmatOperationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

