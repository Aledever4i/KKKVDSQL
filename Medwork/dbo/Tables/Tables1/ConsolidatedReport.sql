CREATE TABLE [dbo].[ConsolidatedReport] (
    [ID]             INT           NOT NULL,
    [AuthorID]       INT           NULL,
    [CreateTime]     DATETIME      NULL,
    [Date1]          DATETIME      NULL,
    [Date2]          DATETIME      NULL,
    [ReportObjID]    NVARCHAR (50) NULL,
    [ReportTypeGUID] NVARCHAR (32) NULL,
    CONSTRAINT [ConsolidatedReportPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

