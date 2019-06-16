CREATE TABLE [dbo].[EndotelialnayaMikroskopiyarogovici] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [max_od]   INT           NULL,
    [max_os]   INT           NULL,
    [sred_od]  INT           NULL,
    [sred_os]  INT           NULL,
    [sd_od]    NVARCHAR (1)  NULL,
    [sd_os]    NVARCHAR (1)  NULL,
    [Zakl_od]  NVARCHAR (50) NULL,
    [Zakl_os]  NVARCHAR (50) NULL,
    [sv_od]    NVARCHAR (1)  NULL,
    [absol_od] INT           NULL,
    [min_os]   INT           NULL,
    [absol_os] INT           NULL,
    [sv_os]    NVARCHAR (1)  NULL,
    [min_od]   INT           NULL,
    CONSTRAINT [EndotelialnayaMikroskopiyarogoviciPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EndotelialnayaMikroskopiyarogoviciToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

