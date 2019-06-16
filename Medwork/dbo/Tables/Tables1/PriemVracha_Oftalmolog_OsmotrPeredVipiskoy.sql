CREATE TABLE [dbo].[PriemVracha_Oftalmolog_OsmotrPeredVipiskoy] (
    [ID]                INT           NOT NULL,
    [PatID]             INT           NULL,
    [Data]              DATETIME      NULL,
    [Vrach]             NVARCHAR (50) NULL,
    [ObektivnieDannie]  NTEXT         NULL,
    [DiagnozPriVipiske] NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_Oftalmolog_OsmotrPeredVipiskoyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Oftalmolog_OsmotrPeredVipiskoyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

