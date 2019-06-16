CREATE TABLE [dbo].[comport] (
    [ID]         INT           NOT NULL,
    [SystemUser] NVARCHAR (50) NULL,
    [port]       NVARCHAR (50) NULL,
    CONSTRAINT [comportPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

