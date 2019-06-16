CREATE TABLE [dbo].[PriemVracha_Endokrinolog_Eop] (
    [ID]                          INT           NOT NULL,
    [PatID]                       INT           NULL,
    [diplopia]                    NVARCHAR (50) NULL,
    [Veki]                        NVARCHAR (50) NULL,
    [DvizhenieGlaznihYablok]      NVARCHAR (50) NULL,
    [konuktiva]                   NVARCHAR (50) NULL,
    [ostrotaZrenia]               NVARCHAR (50) NULL,
    [BolPriDvizheniyahMemo]       NTEXT         NULL,
    [BolPriDvizheniyah]           NVARCHAR (1)  NULL,
    [RetrobulbarnayaBoleznennost] NVARCHAR (1)  NULL,
    CONSTRAINT [PriemVracha_Endokrinolog_EopPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Endokrinolog_EopToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

