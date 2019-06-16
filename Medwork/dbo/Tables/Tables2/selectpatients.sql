CREATE TABLE [dbo].[selectpatients] (
    [ID]              INT            NOT NULL,
    [idpatient]       INT            NULL,
    [Date]            DATETIME       NULL,
    [idusr]           NVARCHAR (50)  NULL,
    [ActionID]        INT            NULL,
    [FormID]          INT            NULL,
    [FormTypeID]      INT            NULL,
    [PATIENTFIO]      NVARCHAR (200) NULL,
    [IsSendingToFOMS] BIT            CONSTRAINT [DF_selectpatients_IsSendingToFOMS] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [selectpatients_Patient] FOREIGN KEY ([idpatient]) REFERENCES [dbo].[Patient] ([ID]) ON DELETE CASCADE
);

