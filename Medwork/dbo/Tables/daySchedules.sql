CREATE TABLE dbo.daySchedules
(
    ID int IDENTITY (1, 1) NOT NULL CONSTRAINT pkDSchedID PRIMARY KEY CLUSTERED,
    TemplateDaySchedule int NULL CONSTRAINT fkDSchedTemplateDS REFERENCES dbo.TemplateDaySchedules(ID),
    ResourceID int NOT NULL,
    Notes nvarchar (50) NULL
);

