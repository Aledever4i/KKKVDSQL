CREATE TABLE [dbo].[AccountScheme] (
    [ID]      INT           NOT NULL,
    [PayType] NVARCHAR (50) NULL,
    CONSTRAINT [AccountSchemePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

