CREATE TABLE [dbo].[Provider] (
    [ID]               INT            NOT NULL,
    [RealAddress]      NVARCHAR (100) NULL,
    [LegalAddress]     NVARCHAR (100) NULL,
    [Bank]             NTEXT          NULL,
    [INN]              NVARCHAR (50)  NULL,
    [Phone]            NVARCHAR (50)  NULL,
    [Fax]              NVARCHAR (50)  NULL,
    [eMail]            NVARCHAR (100) NULL,
    [ContactPerson]    NVARCHAR (100) NULL,
    [Comment]          NTEXT          NULL,
    [FullName]         NVARCHAR (100) NULL,
    [OverpricePercent] MONEY          NULL,
    [KPP]              NVARCHAR (50)  NULL,
    [DeptID]           INT            NULL,
    [Receiveperson]    INT            NULL,
    CONSTRAINT [ProviderPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

