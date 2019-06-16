CREATE TABLE [dbo].[Producer] (
    [ID]       INT            NOT NULL,
    [Name]     NVARCHAR (100) NULL,
    [Comment]  NTEXT          NULL,
    [FullName] NVARCHAR (100) NULL,
    CONSTRAINT [ProducerPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

