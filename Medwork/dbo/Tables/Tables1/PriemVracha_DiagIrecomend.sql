CREATE TABLE [dbo].[PriemVracha_DiagIrecomend] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [Lab_Inst_obsl_memo]       NTEXT         NULL,
    [Rezim]                    NVARCHAR (50) NULL,
    [DataSledYavky]            DATETIME      NULL,
    [Dieta_Text]               NVARCHAR (80) NULL,
    [Vrach2]                   NVARCHAR (20) NULL,
    [vidanS]                   DATETIME      NULL,
    [ProdlenS]                 DATETIME      NULL,
    [ZakritS]                  DATETIME      NULL,
    [VidanPo]                  DATETIME      NULL,
    [ProdlenPo]                DATETIME      NULL,
    [Zakluchenie_dlya_vipiski] NTEXT         NULL,
    CONSTRAINT [PriemVracha_DiagIrecomendPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_DiagIrecomendToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

