CREATE TABLE [dbo].[RMIS_DD] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [DD_TAG]   NVARCHAR (10)  NULL,
    [DD_VAL]   NVARCHAR (150) NULL,
    CONSTRAINT [RMIS_DDPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

