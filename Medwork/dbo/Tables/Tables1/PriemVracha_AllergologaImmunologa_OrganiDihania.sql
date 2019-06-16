CREATE TABLE [dbo].[PriemVracha_AllergologaImmunologa_OrganiDihania] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [DihanieCherezNos] NVARCHAR (50) NULL,
    [mindaliny]        NVARCHAR (50) NULL,
    [mindaliny2]       NVARCHAR (50) NULL,
    [zev]              NVARCHAR (50) NULL,
    [vydelenieiznosa]  NVARCHAR (50) NULL,
    [Chdd]             INT           NULL,
    [formagrkl]        NVARCHAR (50) NULL,
    [uchvakte]         NVARCHAR (50) NULL,
    [PriPalpatsii5]    NVARCHAR (50) NULL,
    [perkutorno]       NVARCHAR (50) NULL,
    [Dihanie2]         NVARCHAR (80) NULL,
    [hripy]            NVARCHAR (50) NULL,
    [hripy2]           NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_AllergologaImmunologa_OrganiDihaniaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_AllergologaImmunologa_OrganiDihaniaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

