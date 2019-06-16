CREATE TABLE [dbo].[PovtorniyPriMFizioterapevta] (
    [ID]                    INT           NOT NULL,
    [PatID]                 INT           NULL,
    [Data]                  DATETIME      NULL,
    [Vrach]                 NVARCHAR (50) NULL,
    [PredvaritelniyDiagnoz] NTEXT         NULL,
    [ObektivniyStatus]      NTEXT         NULL,
    [DopolnitelnieDannie]   NTEXT         NULL,
    [Zaklyuchenie]          NTEXT         NULL,
    [LechenieNaDomu]        NVARCHAR (1)  NULL,
    [KursLecheniyaS]        DATETIME      NULL,
    [LechenieZakoncheno]    NVARCHAR (1)  NULL,
    [Po]                    DATETIME      NULL,
    CONSTRAINT [PovtorniyPriMFizioterapevtaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMFizioterapevtaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

