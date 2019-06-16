CREATE TABLE [dbo].[RMIS_PO] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [AttID]    INT            NULL,
    [PATIENT]  NVARCHAR (36)  NULL,
    [T_POL]    NVARCHAR (1)   NULL,
    [S_POL]    NVARCHAR (16)  NULL,
    [SN_POL]   NVARCHAR (16)  NULL,
    [C_T]      NVARCHAR (2)   NULL,
    [Q_OGRN]   NVARCHAR (15)  NULL,
    [QD_NAME]  NVARCHAR (254) NULL,
    [DATE_N]   DATETIME       NULL,
    [DATE_E]   DATETIME       NULL,
    [POL_S]    NVARCHAR (1)   NULL,
    [CHD]      DATETIME       NULL,
    CONSTRAINT [RMIS_POPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

