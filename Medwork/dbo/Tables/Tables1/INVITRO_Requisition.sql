CREATE TABLE [dbo].[INVITRO_Requisition] (
    [ID]             INT            NOT NULL,
    [PatID]          INT            NULL,
    [ReqID]          NVARCHAR (30)  NULL,
    [RGUID]          NVARCHAR (40)  NULL,
    [RStatus]        NVARCHAR (3)   NULL,
    [RType]          NVARCHAR (8)   NULL,
    [PatSurname]     NVARCHAR (25)  NULL,
    [PatFirstName]   NVARCHAR (25)  NULL,
    [PatSex]         NVARCHAR (1)   NULL,
    [PatBirthDate]   DATETIME       NULL,
    [Document]       IMAGE          NULL,
    [RComment]       NVARCHAR (200) NULL,
    [SampleTaken]    BIT            NULL,
    [SendDate]       DATETIME       NULL,
    [TakeSampleDate] DATETIME       NULL,
    [NaprId]         INT            NULL,
    CONSTRAINT [INVITRO_RequisitionPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [INVITRO_RequisitionToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

