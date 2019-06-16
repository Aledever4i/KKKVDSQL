CREATE TABLE [dbo].[Posts] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [CodePost] NVARCHAR (50) NULL,
    [NamePost] NVARCHAR (50) NULL,
    [Rate]     NVARCHAR (50) NULL,
    [DolgnId]  INT           NULL,
    CONSTRAINT [PostsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

