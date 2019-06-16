CREATE TABLE [dbo].[tablo_kab_status] (
    [ID]           INT           NOT NULL,
    [MasterID]     INT           NULL,
    [Resource]     INT           NULL,
    [kab]          NVARCHAR (50) NULL,
    [StatusID]     INT           NULL,
    [isView]       NVARCHAR (1)  NULL,
    [timestamp]    DATETIME      NULL,
    [VremyaPriema] DATETIME      NULL,
    CONSTRAINT [tablo_kab_statusPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

