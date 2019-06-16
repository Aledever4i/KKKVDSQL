CREATE TABLE [dbo].[FRep_OMSPaidSum] (
    [GUID]         UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]     INT              NULL,
    [ConnectionID] INT              NULL,
    [CountOMS]     INT              NULL,
    [CountOMSPaid] INT              NULL,
    [SumOMSPaid]   MONEY            NULL,
    CONSTRAINT [FRep_OMSPaidSumPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_OMSPaidSumToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

