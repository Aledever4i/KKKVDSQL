CREATE TABLE [dbo].[REESTR] (
    [COD]     FLOAT (53)    NULL,
    [NAME]    NVARCHAR (80) NULL,
    [TYPE]    NVARCHAR (1)  NULL,
    [DAYS]    SMALLINT      NULL,
    [MDAYS]   SMALLINT      NULL,
    [W]       SMALLINT      NULL,
    [PRICE]   FLOAT (53)    NULL,
    [MOPRICE] FLOAT (53)    NULL,
    [UET_VR]  FLOAT (53)    NULL,
    [UET_MS]  FLOAT (53)    NULL,
    [SKORP]   BIT           NOT NULL,
    [FED]     SMALLINT      NULL,
    [ERRUPD]  BIT           NOT NULL
);

