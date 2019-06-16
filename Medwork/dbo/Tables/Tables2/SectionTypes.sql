CREATE TABLE [dbo].[SectionTypes] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Type] NVARCHAR (20) NULL,
    CONSTRAINT [PK_SectionTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

