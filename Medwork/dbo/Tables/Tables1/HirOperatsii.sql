CREATE TABLE [dbo].[HirOperatsii] (
    [ID]                  INT           NOT NULL,
    [PatID]               INT           NULL,
    [MasterID]            INT           NULL,
    [NazvanieOperatsii]   NVARCHAR (50) NULL,
    [Data]                DATETIME      NULL,
    [MetodObezbolivaniya] NVARCHAR (50) NULL,
    [Oslozhneniya]        NVARCHAR (50) NULL,
    [Operiroval]          NVARCHAR (50) NULL,
    [Chas]                FLOAT (53)    NULL,
    CONSTRAINT [HirOperatsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [HirOperatsiiToMeditsinskayaKartaStatsionarnogoBolnogoF003U] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[MeditsinskayaKartaStatsionarnogoBolnogoF003U] ([ID]) ON DELETE CASCADE
);

