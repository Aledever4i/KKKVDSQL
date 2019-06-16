CREATE TABLE [dbo].[PovtorniyPriMUrologa] (
    [ID]                          INT           NOT NULL,
    [PatID]                       INT           NULL,
    [Data]                        DATETIME      NULL,
    [Vrach]                       NVARCHAR (50) NULL,
    [NaruzhniePolovieOrgani]      NTEXT         NULL,
    [Mocheispuskanie]             NTEXT         NULL,
    [Videleniya]                  NTEXT         NULL,
    [InstrumentalnoeObsledovanie] NTEXT         NULL,
    [DopolnitelnieDannie]         NTEXT         NULL,
    CONSTRAINT [PovtorniyPriMUrologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMUrologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

