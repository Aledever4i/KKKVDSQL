CREATE TABLE [dbo].[LekarstvennayaProba] (
    [ID]                      INT           NOT NULL,
    [PatID]                   INT           NULL,
    [LekarstvennayaProbaS]    NVARCHAR (50) NULL,
    [Data]                    DATETIME      NULL,
    [Vrach]                   NVARCHAR (50) NULL,
    [EkgDoPriemaPreparata]    NTEXT         NULL,
    [EkgPoslePriemaPreparata] NTEXT         NULL,
    [Zaklyuchenie]            NTEXT         NULL,
    CONSTRAINT [LekarstvennayaProbaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LekarstvennayaProbaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

