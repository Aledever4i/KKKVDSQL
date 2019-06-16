CREATE TABLE [dbo].[ResourceService] (
    [ID]       INT           NOT NULL,
    [Resource] INT           NULL,
    [Service]  NVARCHAR (20) NULL,
    CONSTRAINT [ResourceServicePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

