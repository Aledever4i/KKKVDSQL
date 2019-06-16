CREATE TABLE [dbo].[PatPolices] (
    [RecId]       INT           IDENTITY (1, 1) NOT NULL,
    [PatientId]   INT           NOT NULL,
    [CompanyId]   INT           NOT NULL,
    [PolisNumber] VARCHAR (100) NOT NULL,
    [PolisStart]  DATE          NOT NULL,
    [PolisEnd]    DATE          NULL,
    [EditStamp]   DATETIME      NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_PatPolices_InsertStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PatPolices] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

