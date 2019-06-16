CREATE TABLE [dbo].[compulsoryinsurance] (
    [code]             NVARCHAR (20)  NULL,
    [servicename]      NVARCHAR (255) NULL,
    [price]            MONEY          NULL,
    [ID]               INT            NOT NULL,
    [Uet]              FLOAT (53)     NULL,
    [Child]            BIT            NULL,
    [FormaOsmotra]     NVARCHAR (50)  NULL,
    [Resource]         INT            NULL,
    [ObjectID]         INT            NULL,
    [tablename]        NVARCHAR (50)  NULL,
    [UETSister]        FLOAT (53)     NULL,
    [Measure]          NVARCHAR (50)  NULL,
    [RegionTFOMS]      INT            NULL,
    [MasterID]         INT            NULL,
    [NodeType]         NVARCHAR (12)  NULL,
    [CodeNomenklature] NVARCHAR (20)  NULL,
    [Komment]          NVARCHAR (200) NULL,
    CONSTRAINT [CompulsoryInsurancePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

