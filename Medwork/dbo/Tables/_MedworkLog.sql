CREATE TABLE [dbo].[_MedworkLog] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [EventClass] INT            NOT NULL,
    [EventType]  INT            NOT NULL,
    [eDateTime]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [UserID]     INT            NOT NULL,
    [UserName]   NVARCHAR (255) NOT NULL,
    [CompName]   NVARCHAR (32)  NOT NULL,
    [Source]     NVARCHAR (255) NOT NULL,
    [Brief]      NVARCHAR (255) NOT NULL,
    [Details]    NTEXT          NULL
);

