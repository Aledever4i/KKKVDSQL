CREATE TABLE [dbo].[Laboratory] (
    [ID]             INT            NOT NULL,
    [Name]           NVARCHAR (256) NULL,
    [IsOrganisation] INT            NULL,
    [OrgID]          INT            NULL,
    [DeliverType]    INT            NULL,
    [Type]           INT            NULL,
    [NoResult]       BIT            NULL
);

