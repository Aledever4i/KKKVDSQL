CREATE TABLE [dbo].[SchedulingBlock] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (250) NULL,
    [Color]       INT            NULL,
    [DateEnabled] DATETIME       NULL,
    [Duration]    INT            NOT NULL,
    [DateBlock]   DATETIME       NOT NULL,
    [ResourceID]  INT            NOT NULL,
    [UserID]      INT            NULL,
    [DateCreate]  DATETIME       NULL
);

