CREATE TABLE [dbo].[SyncDicDataSource] (
    [ID]                 INT            NOT NULL,
    [MasterID]           INT            NULL,
    [GetData]            BIT            NULL,
    [RemoteConnectionID] INT            NULL,
    [connect_result]     NVARCHAR (200) NULL,
    [DBName]             NVARCHAR (50)  NULL,
    [LinkSrvName]        NVARCHAR (50)  NULL,
    [SrvName]            NVARCHAR (50)  NULL,
    CONSTRAINT [SyncDicDataSourcePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

