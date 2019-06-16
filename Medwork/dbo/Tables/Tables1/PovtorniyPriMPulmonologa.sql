CREATE TABLE [dbo].[PovtorniyPriMPulmonologa] (
    [ID]                  INT           NOT NULL,
    [PatID]               INT           NULL,
    [Data]                DATETIME      NULL,
    [Vrach]               INT           NULL,
    [ObektivniyStatus]    NTEXT         NULL,
    [ObsheeSostoyanie]    INT           NULL,
    [TemperaturaTela]     FLOAT (53)    NULL,
    [VirazhenieLitsa]     INT           NULL,
    [OrganiDihaniya]      NTEXT         NULL,
    [VidimieSlizistie]    INT           NULL,
    [VidimieSlizistie1]   INT           NULL,
    [Visipaniya]          NVARCHAR (25) NULL,
    [LimfaticheskieUzli1] NTEXT         NULL,
    [ZevKrasnota1]        NVARCHAR (1)  NULL,
    [ZevPripuhlost1]      NVARCHAR (1)  NULL,
    [ZevNalet1]           NVARCHAR (1)  NULL,
    [Zev1]                NTEXT         NULL,
    CONSTRAINT [PovtorniyPriMPulmonologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMPulmonologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

