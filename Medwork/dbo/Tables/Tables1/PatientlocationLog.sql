CREATE TABLE [dbo].[PatientlocationLog] (
    [ID]       INT NOT NULL,
    [PatID]    INT NULL,
    [MasterID] INT NULL,
    [ID001]    INT NULL,
    CONSTRAINT [PatientlocationLogPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PatientlocationLogToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

