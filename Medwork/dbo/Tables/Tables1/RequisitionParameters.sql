CREATE TABLE [dbo].[RequisitionParameters] (
    [ID]             INT           NOT NULL,
    [MasterID]       INT           NULL,
    [Parameter]      NVARCHAR (50) NULL,
    [AuthorID]       INT           NULL,
    [ParameterValue] NVARCHAR (50) NULL
);

