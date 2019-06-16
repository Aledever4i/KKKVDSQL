CREATE TABLE [dbo].[HairTerapistBioCapilar] (
    [ID]          INT      NOT NULL,
    [PatID]       INT      NULL,
    [ScalpTreat]  NTEXT    NULL,
    [HairTreat]   NTEXT    NULL,
    [HomeTreat]   NTEXT    NULL,
    [WeeklyNotes] NTEXT    NULL,
    [DocDate]     DATETIME NULL,
    [DocTime]     DATETIME NULL,
    [DoctorID]    INT      NULL,
    CONSTRAINT [HairTerapistBioCapilarPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [HairTerapistBioCapilarToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

