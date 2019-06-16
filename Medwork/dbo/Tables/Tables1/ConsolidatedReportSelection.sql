CREATE TABLE [dbo].[ConsolidatedReportSelection] (
    [ID]             INT           NOT NULL,
    [MasterID]       INT           NULL,
    [Selected]       BIT           NULL,
    [ReportTypeGUID] NVARCHAR (32) NULL,
    CONSTRAINT [ConsolidatedReportSelectionPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ConsolidatedReportSelectionToConsolidatedReport] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

