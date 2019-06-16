CREATE TABLE [dbo].[EtapniyEpikrizNaVkk] (
    [ID]                             INT           NOT NULL,
    [PatID]                          INT           NULL,
    [Data]                           DATETIME      NULL,
    [NaBolnichnomListeS]             DATETIME      NULL,
    [NaBolnichnomListePo]            DATETIME      NULL,
    [Dney]                           INT           NULL,
    [Diagnoz]                        NVARCHAR (50) NULL,
    [DinamikaSostoyaniya]            NTEXT         NULL,
    [ProvodimoeLechenie]             NTEXT         NULL,
    [NuzhdaetsyaVProdleniiBListkaDo] DATETIME      NULL,
    [Vrach]                          INT           NULL,
    CONSTRAINT [EtapniyEpikrizNaVkkPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EtapniyEpikrizNaVkkToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

