CREATE TABLE [dbo].[BHMK_Dicts] (
    [ID]         INT           NOT NULL,
    [Code]       NVARCHAR (20) NULL,
    [ExternalID] NVARCHAR (50) NULL,
    [Title]      NVARCHAR (50) NULL,
    [Domain]     NVARCHAR (50) NULL,
    CONSTRAINT [BHMK_DictsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

