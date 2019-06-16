CREATE TABLE [dbo].[PriemVracha_AllergologaImmunologa_Reaktsi] (
    [ID]           INT           NOT NULL,
    [PatID]        INT           NULL,
    [MasterID]     INT           NULL,
    [NaChtoImenno] NVARCHAR (50) NULL,
    [Preparat]     NVARCHAR (50) NULL,
    [Data]         DATETIME      NULL,
    [VidReaktsii]  NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_AllergologaImmunologa_ReaktsiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_AllergologaImmunologa_ReaktsiToPriemVracha_AllergologaImmunologa] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PriemVracha_AllergologaImmunologa] ([ID]) ON DELETE CASCADE
);

