CREATE TABLE [dbo].[PriemVracha_Oftalmolog_OstrotaZrenia] (
    [ID]               INT          NOT NULL,
    [PatID]            INT          NULL,
    [VisusCyl_OD]      FLOAT (53)   NULL,
    [VisusSph_OD]      FLOAT (53)   NULL,
    [VisusSph_OS]      FLOAT (53)   NULL,
    [VisusCyl_OS]      FLOAT (53)   NULL,
    [VisusAx_OD]       INT          NULL,
    [VisusAx_OS]       INT          NULL,
    [Visus_sph1]       FLOAT (53)   NULL,
    [Visus_sph2]       FLOAT (53)   NULL,
    [Gradus]           FLOAT (53)   NULL,
    [Gradus1]          FLOAT (53)   NULL,
    [plusminusVisusOD] NVARCHAR (1) NULL,
    [plusminusVisusOS] NVARCHAR (1) NULL,
    [RecNo]            INT          NULL,
    CONSTRAINT [PriemVracha_Oftalmolog_OstrotaZreniaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Oftalmolog_OstrotaZreniaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

