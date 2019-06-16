CREATE TABLE [dbo].[OTDEL] (
    [id]       INT           NOT NULL,
    [MasterId] INT           NULL,
    [OTD]      NVARCHAR (4)  NULL,
    [IOTD]     NVARCHAR (4)  NULL,
    [NAME]     NVARCHAR (40) NULL,
    [TYPE]     SMALLINT      NULL,
    [CNT_BED]  FLOAT (53)    NULL,
    [W]        NVARCHAR (1)  NULL,
    [WOZR]     SMALLINT      NULL,
    [FED]      SMALLINT      NULL,
    CONSTRAINT [otdelToDept] FOREIGN KEY ([MasterId]) REFERENCES [dbo].[Dept] ([ID]) ON DELETE CASCADE
);

