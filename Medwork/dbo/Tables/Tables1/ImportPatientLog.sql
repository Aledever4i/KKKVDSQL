﻿CREATE TABLE [dbo].[ImportPatientLog] (
    [ID]                        INT            NOT NULL,
    [OWNER_ID]                  INT            NULL,
    [IMPORT_DATE]               DATETIME       NULL,
    [SK_ORG_ID]                 INT            NULL,
    [SK_ORG_DOG_ID]             INT            NULL,
    [SK_MAIL_NUM]               NVARCHAR (20)  NULL,
    [SK_MAIL_DATE]              DATETIME       NULL,
    [SOURCE_FULL_FILE_NAME]     NVARCHAR (260) NULL,
    [DATA_TO_BUFFER_IMPORTED]   BIT            NULL,
    [PATIENT_REGISTERED_ID]     INT            NULL,
    [PATIENT_ATTACHED_ID]       INT            NULL,
    [ATTTYPE_ID]                INT            NULL,
    [good]                      BIT            NULL,
    [ImportFormat]              INT            NULL,
    [Profosmotr]                BIT            NULL,
    [OrgEmployeesCount]         INT            NULL,
    [OrgEmployeesWomenCount]    INT            NULL,
    [OrgEmployeesUnder18Count]  INT            NULL,
    [OrgEmployeesDisabledCount] INT            NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([OWNER_ID]) REFERENCES [dbo].[Usr] ([ID]),
    FOREIGN KEY ([PATIENT_ATTACHED_ID]) REFERENCES [dbo].[TotalStateOfPatientAttachment] ([ID]),
    FOREIGN KEY ([PATIENT_REGISTERED_ID]) REFERENCES [dbo].[TotalStateOfPatientRegistration] ([ID])
);

