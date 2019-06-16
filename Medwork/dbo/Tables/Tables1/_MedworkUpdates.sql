CREATE TABLE [dbo].[_MedworkUpdates] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [eDateTime] DATETIME       DEFAULT (getdate()) NOT NULL,
    [GUID]      NVARCHAR (32)  NOT NULL,
    [ObjName]   NVARCHAR (255) NOT NULL,
    [UserID]    INT            NOT NULL,
    [UserName]  NVARCHAR (255) NOT NULL,
    [CompName]  NVARCHAR (32)  NOT NULL
);

