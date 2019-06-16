CREATE TABLE [dbo].[INVITRO_Replay_buf] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [SurName]          NVARCHAR (35) NULL,
    [FirstName]        NVARCHAR (35) NULL,
    [Sex]              NVARCHAR (1)  NULL,
    [BirthDate]        DATETIME      NULL,
    [AcseptResult]     BIT           NULL,
    [AcseptUser]       INT           NULL,
    [AcseptDate]       DATETIME      NULL,
    [RequisitionID]    INT           NULL,
    [ReservePatientID] NVARCHAR (11) NULL,
    [ReceiveDate]      DATETIME      NULL,
    CONSTRAINT [INVITRO_Replay_bufPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

