CREATE TABLE [dbo].[RMIS_MR] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [MCOD]     NVARCHAR (15) NULL,
    [PCOD]     NVARCHAR (15) NULL,
    [S_POL]    NVARCHAR (6)  NULL,
    [SN_POL]   NVARCHAR (16) NULL,
    [FAM]      NVARCHAR (30) NULL,
    [IM]       NVARCHAR (25) NULL,
    [OT]       NVARCHAR (25) NULL,
    [DR]       DATETIME      NULL,
    [W]        NVARCHAR (1)  NULL,
    [LGOT_R]   NVARCHAR (1)  NULL,
    [D_PRIK]   DATETIME      NULL,
    [CHD]      DATETIME      NULL,
    CONSTRAINT [RMIS_MRPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

