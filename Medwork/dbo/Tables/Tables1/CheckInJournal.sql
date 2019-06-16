CREATE TABLE [dbo].[CheckInJournal] (
    [ID]         INT           NOT NULL,
    [MasterID]   INT           NULL,
    [DocNum]     NVARCHAR (50) NULL,
    [FamilyName] NVARCHAR (50) NULL,
    [FirstName]  NVARCHAR (50) NULL,
    [SecondName] NVARCHAR (50) NULL,
    [PutevkaNum] NVARCHAR (50) NULL,
    [Diagnoz]    NVARCHAR (50) NULL,
    [Kategoriya] NVARCHAR (50) NULL,
    [BirthDate]  DATETIME      NULL
);

