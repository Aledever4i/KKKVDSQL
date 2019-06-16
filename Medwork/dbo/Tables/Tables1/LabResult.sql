CREATE TABLE [dbo].[LabResult] (
    [ID]              INT            NOT NULL,
    [MasterID]        INT            NULL,
    [MeasurementName] NVARCHAR (200) NULL,
    [Description]     NVARCHAR (100) NULL,
    [VerifierName]    NVARCHAR (512) NULL,
    [FinishDate]      DATETIME       NULL,
    [Unit]            NVARCHAR (50)  NULL,
    [ResultValue]     NTEXT          NULL,
    CONSTRAINT [LabResultPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LabResultToLabResults] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LabResults] ([ID]) ON DELETE CASCADE
);

