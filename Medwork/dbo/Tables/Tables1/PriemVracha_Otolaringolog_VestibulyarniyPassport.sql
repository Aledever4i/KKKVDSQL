CREATE TABLE [dbo].[PriemVracha_Otolaringolog_VestibulyarniyPassport] (
    [ID]                  INT           NOT NULL,
    [PatID]               INT           NULL,
    [PressornayaProba]    NVARCHAR (80) NULL,
    [FlangovayaPohodka]   NVARCHAR (80) NULL,
    [PozaRomberga]        NVARCHAR (80) NULL,
    [Rvota]               NVARCHAR (80) NULL,
    [Golovokruzhenie]     NVARCHAR (80) NULL,
    [ProbaNaDiadohokinez] NVARCHAR (80) NULL,
    [PohodkaPoPryamoy]    NVARCHAR (80) NULL,
    [PaltseNosovayaProba] NVARCHAR (80) NULL,
    [Toshnota]            NVARCHAR (80) NULL,
    CONSTRAINT [PriemVracha_Otolaringolog_VestibulyarniyPassportPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Otolaringolog_VestibulyarniyPassportToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

