CREATE TABLE [dbo].[RequisitionService] (
    [ID]            INT            NOT NULL,
    [MasterID]      INT            NULL,
    [ServiceCode]   NVARCHAR (50)  NULL,
    [ServiceName]   NVARCHAR (256) NULL,
    [GUID]          NVARCHAR (32)  NULL,
    [Comment]       NVARCHAR (256) NULL,
    [ServiceID]     NVARCHAR (50)  NULL,
    [ContainerCode] NVARCHAR (50)  NULL,
    CONSTRAINT [RequisitionServicePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RequisitionServiceToRequisition] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Requisition] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [RequisitionServiceGUIDIdx]
    ON [dbo].[RequisitionService]([GUID] ASC);

