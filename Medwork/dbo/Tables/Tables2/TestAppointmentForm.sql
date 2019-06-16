CREATE TABLE [dbo].[TestAppointmentForm] (
    [ID]                INT           NOT NULL,
    [PatID]             INT           NULL,
    [ResourceID]        INT           NULL,
    [ReceptionDateTime] DATETIME      NULL,
    [CreationDate]      DATETIME      NULL,
    [CreatedBy]         INT           NULL,
    [Color]             INT           NULL,
    [ImageIndex]        INT           NULL,
    [Title]             NVARCHAR (64) NULL,
    [Duration]          INT           NULL,
    CONSTRAINT [TestAppointmentFormPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TestAppointmentFormToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

