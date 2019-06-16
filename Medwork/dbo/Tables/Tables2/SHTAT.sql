CREATE TABLE [dbo].[SHTAT] (
    [PIDNT]    DECIMAL (10)  NULL,
    [PCODE]    NVARCHAR (4)  NULL,
    [MainPost] INT           NULL,
    [IOTD]     NVARCHAR (4)  NULL,
    [FAM]      NVARCHAR (25) NULL,
    [IM]       NVARCHAR (20) NULL,
    [OT]       NVARCHAR (20) NULL,
    [DR]       SMALLDATETIME NULL,
    [W]        NVARCHAR (1)  NULL,
    [TYPE]     SMALLINT      NULL,
    [STAV]     FLOAT (53)    NULL,
    [VAK]      BIT           NULL,
    [IJOB]     SMALLDATETIME NULL,
    [OJOB]     SMALLDATETIME NULL,
    [PROF_ISP] NVARCHAR (9)  NULL,
    [S_POL]    NVARCHAR (6)  NULL,
    [KOD_D]    NVARCHAR (4)  NULL,
    [D_SERTIF] SMALLDATETIME NULL,
    [LGOT_R]   NVARCHAR (1)  NULL,
    [MasterID] INT           NULL,
    [id]       INT           NOT NULL
);

