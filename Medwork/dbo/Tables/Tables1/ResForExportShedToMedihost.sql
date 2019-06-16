CREATE TABLE [dbo].[ResForExportShedToMedihost] (
    [ID]         INT            NOT NULL,
    [TypeId]     INT            NULL,
    [NodeType]   NVARCHAR (12)  NULL,
    [Resource]   INT            NULL,
    [ParentID]   INT            NULL,
    [ExportName] NVARCHAR (100) NULL,
    [message]    NTEXT          NULL,
    CONSTRAINT [ResForExportShedToMedihostPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

