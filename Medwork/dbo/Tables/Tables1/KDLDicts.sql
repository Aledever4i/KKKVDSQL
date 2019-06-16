CREATE TABLE [dbo].[KDLDicts] (
    [ID]     INT            NOT NULL,
    [Code]   NVARCHAR (50)  NULL,
    [Title]  NVARCHAR (100) NULL,
    [Domain] NVARCHAR (50)  NULL,
    CONSTRAINT [KDLDictsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

