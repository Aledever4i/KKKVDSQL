CREATE TABLE [dbo].[LabResultTest_BufferTMP] (
    [ID]              INT             NOT NULL,
    [MasterID]        INT             NULL,
    [SeqNo]           NVARCHAR (10)   NULL,
    [MeasurementName] NVARCHAR (256)  NULL,
    [ResultValue]     NVARCHAR (256)  NULL,
    [ResultText]      NVARCHAR (1024) NULL,
    [NormMin]         NVARCHAR (50)   NULL,
    [NormMax]         NVARCHAR (50)   NULL,
    [Pathology]       NVARCHAR (10)   NULL,
    [OperatorName]    NVARCHAR (512)  NULL,
    [FinishDate]      DATETIME        NULL,
    [ResCount]        NVARCHAR (10)   NULL,
    [Comment]         NVARCHAR (1000) NULL,
    [Unit]            NVARCHAR (50)   NULL,
    [OldMasterID]     NVARCHAR (20)   NULL,
    [NormText]        NVARCHAR (MAX)  NULL,
    [Status]          NVARCHAR (20)   NULL,
    [ShortName]       NVARCHAR (50)   NULL,
    CONSTRAINT [LabResultTest_BufferTMPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LabResultTest_BufferTMPToLabResults_Buffer] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LabResults_Buffer] ([ID]) ON DELETE CASCADE
);

