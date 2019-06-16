CREATE TABLE [dbo].[RMIS_OP] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [MCOD]     NVARCHAR (15)  NULL,
    [CODE]     NVARCHAR (10)  NULL,
    [IOTD]     NVARCHAR (4)   NULL,
    [NAME]     NVARCHAR (254) NULL,
    [PROFILE]  NVARCHAR (4)   NULL,
    [USL]      NVARCHAR (1)   NULL,
    [CNT_BED]  NUMERIC (9)    NULL,
    [CHD]      DATETIME       NULL,
    CONSTRAINT [RMIS_OPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

