CREATE TABLE [dbo].[TFOMS] (
    [ID]        INT             NOT NULL,
    [BriefName] NVARCHAR (50)   NULL,
    [Code]      NVARCHAR (10)   NULL,
    [FullName]  NVARCHAR (2000) NULL,
    [OKATO]     NVARCHAR (50)   NULL,
    [OGRN]      NVARCHAR (50)   NULL,
    [Region]    NVARCHAR (100)  NULL,
    CONSTRAINT [TFOMSPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

