CREATE TABLE [dbo].[Medicalcare] (
    [Data]              DATETIME       NULL,
    [Lech_vrach]        NVARCHAR (50)  NULL,
    [CodMKB]            NVARCHAR (50)  NULL,
    [Faza]              NVARCHAR (50)  NULL,
    [Stadiya]           NVARCHAR (50)  NULL,
    [Oslozhneniya]      NVARCHAR (50)  NULL,
    [UsloviyaOkazaniya] NVARCHAR (50)  NULL,
    [ID]                INT            NOT NULL,
    [PatID]             INT            NULL,
    [dcbSMPID]          INT            NULL,
    [SMPID]             INT            NULL,
    [SMPName]           NVARCHAR (255) NULL,
    [SMPIsConfirmed]    NVARCHAR (1)   NULL,
    CONSTRAINT [PK_Medicalcare] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [MedicalcareToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

