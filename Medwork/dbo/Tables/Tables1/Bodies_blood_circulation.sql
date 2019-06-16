CREATE TABLE [dbo].[Bodies_blood_circulation] (
    [ID]        INT            NOT NULL,
    [Name]      NVARCHAR (150) NULL,
    [ParentID]  INT            NULL,
    [NodeType]  NVARCHAR (12)  NULL,
    [Reference] NVARCHAR (100) NULL,
    [Comments]  NTEXT          NULL,
    [Category]  NTEXT          NULL,
    [selector]  NVARCHAR (1)   NULL
);

