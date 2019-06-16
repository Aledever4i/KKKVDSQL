CREATE TABLE [dbo].[SubMedicalcare] (
    [ID]           INT NOT NULL,
    [MasterID]     INT NULL,
    [UserId]       INT NULL,
    [SubServiceId] INT NULL,
    CONSTRAINT [SubMedicalcarePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SubMedicalcareToMedicalcare] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Medicalcare] ([ID]) ON DELETE CASCADE
);

