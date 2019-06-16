CREATE TABLE [dbo].[NormAttendance] (
    [ID]            INT NOT NULL,
    [DoctorCode]    INT NULL,
    [Year]          INT NULL,
    [NormWorking]   INT NULL,
    [NormVisitings] INT NULL,
    CONSTRAINT [NormAttendancePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

