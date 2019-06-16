CREATE TABLE [dbo].[TotalStateOfPatientAttachment] (
    [ID]                    INT            IDENTITY (0, 1) NOT NULL,
    [PATIENT_ATTSTATE_NAME] NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

