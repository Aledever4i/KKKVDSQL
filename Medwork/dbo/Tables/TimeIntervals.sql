CREATE TABLE [dbo].[TimeIntervals]
(
    ID INT IDENTITY (1, 1) NOT NULL CONSTRAINT pkTimeIntervalID PRIMARY KEY CLUSTERED,
    DayScheduleID INT NOT NULL CONSTRAINT fkTimeIntervalDS REFERENCES dbo.daySchedules(ID) ON DELETE CASCADE,
    BeginTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    LinkedResourceID INT NULL,
    Type INT NOT NULL CONSTRAINT fkTimeIntervalType REFERENCES dbo.TimeIntervalTypes(ID),
    Text NVARCHAR (50) NULL,
    ReceptionInterval INT NOT NULL,
    Quota INT NULL,
    Color INT NULL,
    AppointmentColor INT NULL
);

GO;

CREATE NONCLUSTERED INDEX idxTimeIntervals_dayScheduleID ON dbo.TimeIntervals(DayScheduleID ASC);

