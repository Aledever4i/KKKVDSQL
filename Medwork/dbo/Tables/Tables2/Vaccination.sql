CREATE TABLE [dbo].[Vaccination] (
    [ID]          INT            NOT NULL,
    [PatID]       INT            NULL,
    [MasterID]    INT            NULL,
    [VacType]     NVARCHAR (50)  NULL,
    [VacDate]     DATETIME       NULL,
    [DocNum]      NVARCHAR (50)  NULL,
    [Doctor]      NVARCHAR (255) NULL,
    [Hospital]    NVARCHAR (255) NULL,
    [NextVacDate] DATETIME       NULL,
    [Msg]         NTEXT          NULL,
    [AnimalID]    INT            NULL,
    [VacVs]       NVARCHAR (50)  NULL,
    [VacCode]     NVARCHAR (10)  NULL,
    CONSTRAINT [VaccinationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VaccinationToVacPass] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[VacPass] ([ID]) ON DELETE CASCADE
);

