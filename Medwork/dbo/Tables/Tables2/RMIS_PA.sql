CREATE TABLE [dbo].[RMIS_PA] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [PATIENT]  NVARCHAR (36)  NULL,
    [FAM]      NVARCHAR (30)  NULL,
    [IM]       NVARCHAR (25)  NULL,
    [OT]       NVARCHAR (25)  NULL,
    [DR]       DATETIME       NULL,
    [W]        NVARCHAR (1)   NULL,
    [SNILS]    NVARCHAR (14)  NULL,
    [MCOD]     NVARCHAR (15)  NULL,
    [STAT_Z]   NVARCHAR (2)   NULL,
    [PLACE_W]  NVARCHAR (150) NULL,
    [PLACE]    NVARCHAR (254) NULL,
    [PHONE]    NVARCHAR (20)  NULL,
    [INVAL]    NVARCHAR (1)   NULL,
    [C_OKSM]   NVARCHAR (3)   NULL,
    [D_TYPE]   NVARCHAR (1)   NULL,
    [CHD]      DATETIME       NULL,
    CONSTRAINT [RMIS_PAPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

