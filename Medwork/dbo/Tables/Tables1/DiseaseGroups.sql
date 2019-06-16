CREATE TABLE [dbo].[DiseaseGroups] (
    [ID]         INT            NOT NULL,
    [MasterID]   INT            NULL,
    [Code]       NVARCHAR (10)  NULL,
    [Mkb10Codes] NVARCHAR (100) NULL,
    [NodeType]   NVARCHAR (15)  NULL,
    [Name]       NVARCHAR (255) NULL,
    [GUID]       NVARCHAR (50)  NULL,
    CONSTRAINT [DiseaseGroupsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

