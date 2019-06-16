CREATE TABLE [dbo].[RMIS_RP] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [COD_U]    NVARCHAR (36)  NULL,
    [MCOD]     NVARCHAR (15)  NULL,
    [CODE]     NVARCHAR (10)  NULL,
    [PCOD]     NVARCHAR (15)  NULL,
    [PRVS]     NVARCHAR (15)  NULL,
    [D_SER]    DATETIME       NULL,
    [PRVD]     NVARCHAR (4)   NULL,
    [D_PRIK]   DATETIME       NULL,
    [STAV]     NUMERIC (6, 2) NULL,
    [CHD]      DATETIME       NULL,
    CONSTRAINT [RMIS_RPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

