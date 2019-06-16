CREATE TABLE [dbo].[NumIntervals] (
    [ID]          INT            NOT NULL,
    [Data]        DATETIME       NULL,
    [AuthorID]    INT            NULL,
    [TypeDocName] NVARCHAR (200) NULL,
    [TypeDoc]     INT            NULL,
    [Seriya]      NVARCHAR (20)  NULL,
    [isClosed]    NVARCHAR (1)   NULL,
    [NumStart]    NVARCHAR (15)  NULL,
    [NumEnd]      NVARCHAR (15)  NULL,
    CONSTRAINT [NumIntervalsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

