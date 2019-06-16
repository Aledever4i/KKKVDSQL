CREATE TABLE [dbo].[VkladnoyListNomer2] (
    [ID]                        INT           NOT NULL,
    [PatID]                     INT           NULL,
    [MasterID]                  INT           NULL,
    [Data]                      DATETIME      NULL,
    [ObsheeSostoyanie]          NTEXT         NULL,
    [SostoyanieMolochnihZhelez] NVARCHAR (50) NULL,
    [VisotaDnaMatki]            INT           NULL,
    [Lohii]                     NVARCHAR (50) NULL,
    [MochevogoPuzirya]          NVARCHAR (50) NULL,
    [Kishechnika]               NVARCHAR (50) NULL,
    [Naznacheniya]              NVARCHAR (50) NULL,
    CONSTRAINT [VkladnoyListNomer2PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VkladnoyListNomer2ToTecheniePoslerodovogoPeriodaVkladnoyListNomer2] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[TecheniePoslerodovogoPeriodaVkladnoyListNomer2] ([ID]) ON DELETE CASCADE
);

