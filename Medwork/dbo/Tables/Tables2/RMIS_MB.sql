CREATE TABLE [dbo].[RMIS_MB] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [PATIENT]  NVARCHAR (36) NULL,
    [C_I]      NVARCHAR (30) NULL,
    [T_CI]     NVARCHAR (2)  NULL,
    [MB_STAT]  NVARCHAR (2)  NULL,
    [AP_ID]    NVARCHAR (36) NULL,
    [H_TYP]    NVARCHAR (1)  NULL,
    [SRC]      NVARCHAR (1)  NULL,
    [ORD]      NVARCHAR (1)  NULL,
    [ISHOD]    NVARCHAR (3)  NULL,
    [RSLT]     NVARCHAR (3)  NULL,
    [PROG]     NVARCHAR (10) NULL,
    [TRAVMA]   NVARCHAR (2)  NULL,
    [DS_P]     NVARCHAR (6)  NULL,
    [DS]       NVARCHAR (6)  NULL,
    [DS_S]     NVARCHAR (6)  NULL,
    [DS_O]     NVARCHAR (6)  NULL,
    [CHD]      DATETIME      NULL,
    CONSTRAINT [RMIS_MBPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

