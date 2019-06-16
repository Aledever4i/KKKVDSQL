CREATE TABLE [dbo].[HirurgicheskieVmeshatelstva] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [MasterID]   INT           NULL,
    [God]        INT           NULL,
    [Operatsiya] NVARCHAR (90) NULL,
    CONSTRAINT [HirurgicheskieVmeshatelstvaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [HirurgicheskieVmeshatelstvaToSignalnieOtmetki] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[SignalnieOtmetki] ([ID]) ON DELETE CASCADE
);

