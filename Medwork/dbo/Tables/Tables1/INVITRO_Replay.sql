CREATE TABLE [dbo].[INVITRO_Replay] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [SurName]          NVARCHAR (35) NULL,
    [FirstName]        NVARCHAR (35) NULL,
    [Sex]              NVARCHAR (1)  NULL,
    [BirthDate]        DATETIME      NULL,
    [AcseptUser]       INT           NULL,
    [AcseptDate]       DATETIME      NULL,
    [RequisitionID]    INT           NULL,
    [ReservePatientID] NVARCHAR (11) NULL,
    [ReceiveDate]      DATETIME      NULL,
    CONSTRAINT [INVITRO_ReplayPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [INVITRO_ReplayToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

