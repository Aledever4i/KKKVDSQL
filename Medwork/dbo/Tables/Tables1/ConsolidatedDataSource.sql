CREATE TABLE [dbo].[ConsolidatedDataSource] (
    [ID]                 INT            NOT NULL,
    [MasterID]           INT            NULL,
    [GetData]            BIT            NULL,
    [RemoteConnectionID] INT            NULL,
    [connect_result]     NVARCHAR (200) NULL,
    CONSTRAINT [ConsolidatedDataSourcePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ConsolidatedDataSourceToConsolidatedReport] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

