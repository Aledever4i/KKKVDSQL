CREATE TABLE [dbo].[Protseduri] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [MasterID]   INT           NULL,
    [Dateproc]   DATETIME      NULL,
    [NaimenProc] NVARCHAR (50) NULL,
    [kolvo]      INT           NULL,
    [prodolzh]   NVARCHAR (50) NULL,
    [Dozirovka]  NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

