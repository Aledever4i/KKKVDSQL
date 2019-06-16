CREATE TABLE [dbo].[OsmotrPeredVipiskoy] (
    [ID]                INT           NOT NULL,
    [PatID]             INT           NULL,
    [Data]              DATETIME      NULL,
    [Vrach]             NVARCHAR (50) NULL,
    [ObektivnieDannie]  NTEXT         NULL,
    [DiagnozPriVipiske] NVARCHAR (50) NULL,
    CONSTRAINT [OsmotrPeredVipiskoyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrPeredVipiskoyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

