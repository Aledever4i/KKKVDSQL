CREATE TABLE [dbo].[FOMSF003] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [OKATO]          INT           NULL,
    [CODE]           VARCHAR (MAX) NULL,
    [FullName]       VARCHAR (MAX) NULL,
    [Name]           VARCHAR (MAX) NULL,
    [TIN]            VARCHAR (MAX) NULL,
    [OGRN]           VARCHAR (MAX) NULL,
    [KPP]            VARCHAR (MAX) NULL,
    [PostCode]       INT           NULL,
    [Address]        VARCHAR (MAX) NULL,
    [OKOPF]          NCHAR (10)    NULL,
    [VEDPRI]         INT           NULL,
    [ORG]            INT           NULL,
    [LastNameHead]   VARCHAR (MAX) NULL,
    [FirstNameHead]  VARCHAR (MAX) NULL,
    [MiddleNameHead] VARCHAR (MAX) NULL,
    [Phone]          VARCHAR (MAX) NULL,
    [EMail]          VARCHAR (MAX) NULL,
    [IsActive]       BIT           CONSTRAINT [DF_FOMSF003_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FOMSF003] PRIMARY KEY CLUSTERED ([ID] ASC)
);

