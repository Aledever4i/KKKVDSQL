CREATE TABLE [dbo].[FOMSServices] (
    [ID]            INT           NOT NULL,
    [StatTalon]     INT           NULL,
    [IsChild]       BIT           CONSTRAINT [DF_FOMSServices_IsChild] DEFAULT ((0)) NULL,
    [DateStart]     DATETIME      NULL,
    [DateEnd]       DATETIME      NULL,
    [HelpProfileId] INT           NULL,
    [DiagnosisId]   INT           NULL,
    [ServiceCodeId] INT           NULL,
    [ServiceCount]  FLOAT (53)    NULL,
    [DoctorId]      INT           NULL,
    [DepartamentId] INT           NULL,
    [Comment]       VARCHAR (MAX) NULL,
    [InsertStamp]   DATETIME      CONSTRAINT [DF_FOMSServices_InsertStamp] DEFAULT (getdate()) NOT NULL
);

