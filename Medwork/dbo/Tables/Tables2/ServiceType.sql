CREATE TABLE [dbo].[ServiceType] (
    [ID]   NVARCHAR (12)  NOT NULL,
    [Name] NVARCHAR (255) NULL,
    CONSTRAINT [ServiceTypePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

