CREATE TABLE [dbo].[KindMaterial] (
    [ID]           INT            NOT NULL,
    [KindMaterial] NVARCHAR (100) NULL,
    [Special]      BIT            NULL,
    CONSTRAINT [KindMaterialPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

