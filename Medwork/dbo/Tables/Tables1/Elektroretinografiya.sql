CREATE TABLE [dbo].[Elektroretinografiya] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [VolnA_ms_OD]    INT           NULL,
    [VolnA_mV_OS]    INT           NULL,
    [VolnB_ms_OS]    INT           NULL,
    [VolnB_mV_OD]    INT           NULL,
    [VolnB_mV_OS]    INT           NULL,
    [VolnB_ms_OD]    INT           NULL,
    [VolnA_ms_OS]    INT           NULL,
    [VolnA_mV_OD]    INT           NULL,
    [zakluchenie_OD] NVARCHAR (50) NULL,
    [zakluchenie_OS] NVARCHAR (50) NULL,
    [ritm_OD]        NVARCHAR (50) NULL,
    [ritm_OS]        NVARCHAR (50) NULL,
    CONSTRAINT [ElektroretinografiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ElektroretinografiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

