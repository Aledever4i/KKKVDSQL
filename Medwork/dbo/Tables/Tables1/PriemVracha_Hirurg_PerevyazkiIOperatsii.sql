CREATE TABLE [dbo].[PriemVracha_Hirurg_PerevyazkiIOperatsii] (
    [ID]                                           INT           NOT NULL,
    [PatID]                                        INT           NULL,
    [ObrabotkaKozhiRastvoromSpirta70]              NVARCHAR (1)  NULL,
    [ObrabotkaRaniRastvoromPerekisiVodoroda3]      NVARCHAR (1)  NULL,
    [ProizvedenoVskritieGnoynika]                  NVARCHAR (1)  NULL,
    [VipolnenaPunktsiya]                           NVARCHAR (1)  NULL,
    [UstanovlenDrenazh]                            NVARCHAR (1)  NULL,
    [VipolnenaReviziyaRani]                        NVARCHAR (1)  NULL,
    [SvishevoyHodPromitRastvoramiAntiseptikov]     NVARCHAR (1)  NULL,
    [perevyazkaMemo]                               NTEXT         NULL,
    [MestnayaAnesteziyaSolNovocaini2]              NVARCHAR (1)  NULL,
    [MestnayaAnesteziyaSolNovocaini05]             NVARCHAR (1)  NULL,
    [MestnayaAnesteziyaSolLidocaini2]              NVARCHAR (1)  NULL,
    [manipulyacii]                                 NTEXT         NULL,
    [dopdannie]                                    NTEXT         NULL,
    [SvishevoyHodPromitRastvoramiAntiseptikovmemo] NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_Hirurg_PerevyazkiIOperatsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Hirurg_PerevyazkiIOperatsiiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

