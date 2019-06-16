CREATE TABLE [dbo].[BHMK_Services_SpecimenTypes] (
    [ID]                INT            NOT NULL,
    [MasterID]          INT            NULL,
    [SpecimenTypeID]    NVARCHAR (50)  NULL,
    [SpecimenTypeTitle] NVARCHAR (100) NULL,
    CONSTRAINT [BHMK_Services_SpecimenTypesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

