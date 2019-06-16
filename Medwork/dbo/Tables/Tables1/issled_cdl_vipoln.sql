CREATE TABLE [dbo].[issled_cdl_vipoln] (
    [ID]          INT           NOT NULL,
    [Date_Zab]    DATETIME      NULL,
    [LPU]         NVARCHAR (50) NULL,
    [Issled]      NVARCHAR (50) NULL,
    [Ed_Izm]      NVARCHAR (50) NULL,
    [result]      NVARCHAR (20) NULL,
    [Date_vipoln] DATETIME      NULL,
    [PatID]       INT           NULL,
    CONSTRAINT [issled_cdl_vipolnPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

