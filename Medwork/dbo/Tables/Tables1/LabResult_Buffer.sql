CREATE TABLE [dbo].[LabResult_Buffer] (
    [ID]              INT            NOT NULL,
    [MasterID]        INT            NULL,
    [MeasurementName] NVARCHAR (200) NULL,
    [Description]     NVARCHAR (100) NULL,
    [VerifierName]    NVARCHAR (512) NULL,
    [FinishDate]      DATETIME       NULL,
    [Unit]            NVARCHAR (50)  NULL,
    [ResultValue]     NTEXT          NULL,
    [OldID]           NVARCHAR (20)  NULL,
    CONSTRAINT [LabResult_BufferPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LabResult_BufferToLabResults_Buffer] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LabResults_Buffer] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [LabResult_Buffer_MasterId_Idx]
    ON [dbo].[LabResult_Buffer]([MasterID] ASC);

