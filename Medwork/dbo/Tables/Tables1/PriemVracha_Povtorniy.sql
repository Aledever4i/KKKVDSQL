CREATE TABLE [dbo].[PriemVracha_Povtorniy] (
    [ID]                  INT            NOT NULL,
    [PatID]               INT            NULL,
    [PastTreatment]       NTEXT          NULL,
    [PastTreatmentCb]     NVARCHAR (50)  NULL,
    [PastTreatmentCb2]    NVARCHAR (255) NULL,
    [Specialist]          NVARCHAR (50)  NULL,
    [ComplainsCb]         NVARCHAR (50)  NULL,
    [PlanobsledovaniyaCb] NVARCHAR (50)  NULL,
    [Complains]           NTEXT          NULL,
    [DinamikaSostPat]     NVARCHAR (50)  NULL,
    [PlanObsledovaniya]   NTEXT          NULL,
    [ExamCb]              NVARCHAR (255) NULL,
    [Exam]                NTEXT          NULL,
    CONSTRAINT [PriemVracha_PovtorniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_PovtorniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

