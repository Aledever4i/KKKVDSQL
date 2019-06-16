CREATE TABLE [dbo].[EgiszResource] (
    [ID]            INT            NOT NULL,
    [EgiszResource] NVARCHAR (100) NULL,
    [mwResource]    INT            NULL,
    CONSTRAINT [EgiszResourcePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

