CREATE TABLE [dbo].[Dept] (
    [ID]             INT            NOT NULL,
    [ParentID]       INT            CONSTRAINT [DF__Tree__ParentID__77BFCB91] DEFAULT (1) NULL,
    [NodeType]       NVARCHAR (12)  NULL,
    [DeptTypeID]     INT            NULL,
    [DeptCode]       NVARCHAR (50)  NULL,
    [DeptStatus]     INT            NULL,
    [Name]           NVARCHAR (60)  NULL,
    [BriefName]      NVARCHAR (50)  NULL,
    [Location]       NVARCHAR (50)  NULL,
    [BedCount]       INT            NULL,
    [Cost]           FLOAT (53)     NULL,
    [Gender]         NVARCHAR (50)  NULL,
    [DeptAgeType]    INT            NULL,
    [Type]           INT            NULL,
    [DefaultCheckIn] BIT            NULL,
    [LiveBuilding]   BIT            NULL,
    [OrgID]          INT            NULL,
    [KabAddress]     NVARCHAR (120) NULL,
    CONSTRAINT [aaaaaTree_PK] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NodeType]
    ON [dbo].[Dept]([NodeType] ASC);


GO
CREATE NONCLUSTERED INDEX [ParentID]
    ON [dbo].[Dept]([ParentID] ASC);

