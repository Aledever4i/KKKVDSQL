CREATE TABLE [dbo].[DirectionToChistovodnoe] (
    [ID]                  INT           NOT NULL,
    [DestinationId]       NVARCHAR (20) NULL,
    [DestinationDate]     DATETIME      NULL,
    [DoctorId]            INT           NULL,
    [PatID]               INT           NULL,
    [PaymentTypeId]       INT           NULL,
    [DiagnosisId]         NVARCHAR (50) NULL,
    [MkbId]               NVARCHAR (50) NULL,
    [DestinationTakeDate] DATETIME      NULL,
    CONSTRAINT [PK_DirectionToChistovodnoe] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DirectionToChistovodnoeToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

