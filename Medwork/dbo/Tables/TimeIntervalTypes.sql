CREATE TABLE dbo.TimeIntervalTypes
(
    ID INT IDENTITY (1, 1) NOT NULL CONSTRAINT pkTITypeID PRIMARY KEY CLUSTERED,
    Name nvarchar (50) NULL,
    Color INT NOT NULL,
    AppointmentColor INT NOT NULL,
    NameForInfoTablo nvarchar (50) NULL,
    ColorForInfoTablo INT NULL
);

