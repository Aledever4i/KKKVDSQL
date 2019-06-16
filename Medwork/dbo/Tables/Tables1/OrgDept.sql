CREATE TABLE [dbo].[OrgDept] (
    [ID]          INT            NOT NULL,
    [MasterID]    INT            NULL,
    [PARENT]      INT            NULL,
    [Name]        NVARCHAR (100) NULL,
    [NodeType]    NVARCHAR (12)  NULL,
    [OrgDeptType] NVARCHAR (50)  NULL,
    [Cod]         INT            NULL,
    CONSTRAINT [OrgDeptPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OrgDeptToorganisations] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Organisations] ([ID]) ON DELETE CASCADE
);

