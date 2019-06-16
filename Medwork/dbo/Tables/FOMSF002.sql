CREATE TABLE [dbo].[FOMSF002] (
    [RecId]         INT           IDENTITY (1, 1) NOT NULL,
    [OKATO]         VARCHAR (20)  NOT NULL,
    [SMO]           INT           NOT NULL,
    [FullName]      VARCHAR (MAX) NOT NULL,
    [Name]          VARCHAR (MAX) NOT NULL,
    [TIN]           VARCHAR (20)  NOT NULL,
    [ORGN]          VARCHAR (20)  NOT NULL,
    [KPP]           VARCHAR (20)  NULL,
    [OKOPF]         VARCHAR (20)  NULL,
    [LicenseNumber] VARCHAR (100) NULL,
    [LicenseStart]  DATE          NULL,
    [LicenseEnd]    DATE          NULL,
    [IsActive]      BIT           CONSTRAINT [DF_FOMSF002_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FOMSF002] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

