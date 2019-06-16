CREATE TABLE dbo.Usr
(
    ID INT NOT NULL CONSTRAINT [PK__Usr__1C005963] PRIMARY KEY CLUSTERED,
    AltID NVARCHAR (50) NULL,
    Name NVARCHAR (60) NULL,
    DeptID INT NULL,
    Stat NVARCHAR (50) NULL,
    GroupID INT NULL,
    Job NVARCHAR (50) NULL,
    DateOn DATETIME NULL,
    DateOff DATETIME NULL,
    Comment NVARCHAR (50) NULL,
    Schedule NTEXT NULL,
    Status NVARCHAR (10) NULL,
    LogDate DATETIME NULL,
    LastUpdated ROWVERSION NULL,
    SecondName NVARCHAR (50) NULL,
    FirstName NVARCHAR (20) NULL,
    CardNum INT NULL,
    DoctorStatus NVARCHAR (50)    NULL,
    Attendance INT NULL,
    Desease INT NULL,
    FreeService INT NULL,
    PayService INT NULL,
    HomeTime INT NULL,
    WorkTime INT NULL,
    [Group] INT NULL,
    Specialitie INT NULL,
    namespec NVARCHAR (50) NULL,
    IsStomat INT NULL,
    DeptCode NVARCHAR (50) NULL,
    Osnovnoy INT NULL,
    DoctorPost VARCHAR (50) NULL,
    DoctorRate FLOAT (53) NULL,
    DoctorCodePost INT NULL,
    altercode VARCHAR (255) NULL,
    WinAut BIT NULL,
    WinAutMachine NVARCHAR (255) NULL,
    UsrSetup NTEXT NULL,
    LinkedResource INT NULL,
    IsPersonnel BIT DEFAULT (1) NOT NULL,
    IsUser BIT DEFAULT (1) NOT NULL,
    IsMedPersonnel BIT DEFAULT (1) NOT NULL,
    LastName NVARCHAR (60) NULL,
    GroupGUID VARCHAR (32) NULL,
    ZvanieID INT NULL,
    IsAgent BIT NULL,
    AgentPercent FLOAT (53) NULL,
    DoctorRatePerHour  INT NULL,
    FeePercent FLOAT (53) NULL,
    [GUID] UNIQUEIDENTIFIER CONSTRAINT [DF_Usr_GUID] DEFAULT (newid()) NOT NULL,
    GetsAppFee BIT NULL,
    AgentDuration INT NULL,
    BirthDate DATETIME NULL,
    Sex NVARCHAR (1) NULL,
    isWriteLgotnRecept NVARCHAR (1) NULL,
    FOMSProfessionId INT NULL,
    FOMSV015Id INT NULL
);

GO
CREATE NONCLUSTERED INDEX idxUsr_DeptID ON dbo.Usr(DeptID ASC);

GO
CREATE NONCLUSTERED INDEX idxUsr_DeptID_ID_Name ON dbo.Usr(DeptID ASC, ID ASC, Name ASC);

GO
CREATE STATISTICS [_dta_stat_1390172248_1_4] ON [dbo].[Usr]([ID], [DeptID]);

GO
CREATE STATISTICS [_dta_stat_1390172248_4_3_1] ON [dbo].[Usr]([DeptID], [Name], [ID]);

GO
CREATE TRIGGER tgUsr_Delete on dbo.Usr
AFTER DELETE
AS
SET NOCOUNT ON
DELETE Raspisanie WHERE MasterID IN (SELECT id FROM deleted)

GO
GRANT SELECT ON OBJECT::[dbo].[Usr] TO PUBLIC AS [dbo];

