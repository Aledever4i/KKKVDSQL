CREATE TABLE [dbo].[BHMK_Services] (
    [ID]                INT            NOT NULL,
    [Code]              NVARCHAR (50)  NULL,
    [ExternalID]        NVARCHAR (50)  NULL,
    [Title]             NVARCHAR (512) NULL,
    [SpecimenTypeID]    NVARCHAR (50)  NULL,
    [SpecimenTypeTitle] NVARCHAR (100) NULL,
    CONSTRAINT [BHMK_ServicesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

