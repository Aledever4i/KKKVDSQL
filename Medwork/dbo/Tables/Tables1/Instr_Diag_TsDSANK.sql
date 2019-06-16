CREATE TABLE [dbo].[Instr_Diag_TsDSANK] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [ObshihBedrennih]          NVARCHAR (1)  NULL,
    [PoverhnostnihBedrennih]   NVARCHAR (1)  NULL,
    [PodkolennihArteriy]       NVARCHAR (1)  NULL,
    [ArteriyGoleni]            NVARCHAR (50) NULL,
    [OpisanieStenok]           NTEXT         NULL,
    [PoObshimBedrennim]        NVARCHAR (1)  NULL,
    [PoPoverhnostnimBedrennim] NVARCHAR (1)  NULL,
    [PoPodkolennim]            NVARCHAR (1)  NULL,
    [PoZadnimBolshebertsovim]  NVARCHAR (1)  NULL,
    [PoArteriyamTilaStop]      NVARCHAR (1)  NULL,
    [MemoKrovPoArteriyam]      NTEXT         NULL,
    [DopPole]                  NTEXT         NULL,
    [Zakluchenie]              NTEXT         NULL,
    [ArteriyGoleney]           NVARCHAR (1)  NULL,
    CONSTRAINT [Instr_Diag_TsDSANKPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Instr_Diag_TsDSANKToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

