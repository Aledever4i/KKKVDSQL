CREATE TABLE [dbo].[ReqInfo] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [Value]    NVARCHAR (255) NULL,
    [Code]     NVARCHAR (10)  NULL,
    CONSTRAINT [ReqInfoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ReqInfoToRequisition] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Requisition] ([ID]) ON DELETE CASCADE
);

