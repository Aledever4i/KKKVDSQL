CREATE TABLE [dbo].[Ekg] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [Data]             DATETIME      NULL,
    [Vrach]            NVARCHAR (50) NULL,
    [Ritm]             NVARCHAR (50) NULL,
    [Chss]             INT           NULL,
    [PolozhenieEos]    NVARCHAR (50) NULL,
    [DlitelnostPQC]    INT           NULL,
    [QRSC]             INT           NULL,
    [QTQTKorrS]        INT           NULL,
    [ZubtsiT]          NTEXT         NULL,
    [NarusheniyaRitma] NTEXT         NULL,
    [Zaklyuchenie]     NTEXT         NULL,
    CONSTRAINT [EkgPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EkgToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

