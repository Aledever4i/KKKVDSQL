CREATE TABLE [dbo].[test2] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [Edit]     NVARCHAR (50) NULL,
    [Date]     DATETIME      NULL,
    [Combo]    NVARCHAR (50) NULL,
    [Galochka] NVARCHAR (1)  NULL,
    [DateV]    DATETIME      NULL,
    CONSTRAINT [test2PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

