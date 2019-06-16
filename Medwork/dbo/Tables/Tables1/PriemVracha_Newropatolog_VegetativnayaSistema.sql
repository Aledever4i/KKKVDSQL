CREATE TABLE [dbo].[PriemVracha_Newropatolog_VegetativnayaSistema] (
    [ID]                     INT           NOT NULL,
    [PatID]                  INT           NULL,
    [Dermografizm]           NVARCHAR (50) NULL,
    [SimptopBrenaraGornera]  NVARCHAR (50) NULL,
    [OrtostatProbaADstoya]   NTEXT         NULL,
    [KlinProbaADstoya]       NTEXT         NULL,
    [KlinProbaChssLeza]      NTEXT         NULL,
    [KlinProbaADleza]        NTEXT         NULL,
    [OrtostatProbaChssStoya] NTEXT         NULL,
    [KlinProbaChssStoya]     NTEXT         NULL,
    [OrtostatProbaChssLeza]  NTEXT         NULL,
    [OrtostatProbaADleza]    NTEXT         NULL,
    [ProbaAshnera]           NTEXT         NULL,
    CONSTRAINT [PriemVracha_Newropatolog_VegetativnayaSistemaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Newropatolog_VegetativnayaSistemaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

