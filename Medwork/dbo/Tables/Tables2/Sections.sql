CREATE TABLE [dbo].[Sections] (
    [ID]          INT            NOT NULL,
    [Num]         INT            NULL,
    [Section]     NVARCHAR (100) NULL,
    [Comment]     NTEXT          NULL,
    [TypeSection] INT            NULL,
    CONSTRAINT [SectionsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

