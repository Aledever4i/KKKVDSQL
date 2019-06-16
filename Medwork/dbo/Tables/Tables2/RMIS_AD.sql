CREATE TABLE [dbo].[RMIS_AD] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [PATIENT]  NVARCHAR (36) NULL,
    [TIP_ADR]  NVARCHAR (1)  NULL,
    [AD_ST]    NVARCHAR (3)  NULL,
    [CA_C]     NVARCHAR (2)  NULL,
    [C_A]      NVARCHAR (2)  NULL,
    [RN_C]     NVARCHAR (2)  NULL,
    [RN]       NVARCHAR (80) NULL,
    [GOR_C]    NVARCHAR (2)  NULL,
    [GOR]      NVARCHAR (80) NULL,
    [UL_C]     NVARCHAR (2)  NULL,
    [UL]       NVARCHAR (80) NULL,
    [DOM]      NVARCHAR (10) NULL,
    [KOR]      NVARCHAR (10) NULL,
    [STR]      NVARCHAR (10) NULL,
    [KV]       NVARCHAR (5)  NULL,
    [CHD]      DATETIME      NULL,
    CONSTRAINT [RMIS_ADPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

