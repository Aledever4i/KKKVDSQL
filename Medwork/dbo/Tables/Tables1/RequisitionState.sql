CREATE TABLE [dbo].[RequisitionState] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [State]    NVARCHAR (50)  NULL,
    [DateTime] DATETIME       NULL,
    [AuthorID] INT            NULL,
    [Code]     INT            NULL,
    [Link]     NVARCHAR (256) NULL,
    CONSTRAINT [RequisitionStateToRequisition] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Requisition] ([ID]) ON DELETE CASCADE
);

