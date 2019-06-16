CREATE TABLE [dbo].[DictMultiselect] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [GroupID]    INT            NOT NULL,
    [Checked]    BIT            NULL,
    [Name]       NVARCHAR (100) NULL,
    [Code]       NVARCHAR (20)  NULL,
    [FilterInfo] NVARCHAR (20)  NULL,
    CONSTRAINT [DictMultiselectPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

