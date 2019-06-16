CREATE TABLE [dbo].[Resources] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [masterID]        INT            NULL,
    [LinkedResource]  INT            NULL,
    [Type]            INT            NULL,
    [UsrID]           INT            NULL,
    [RoomID]          INT            NULL,
    [Name]            NVARCHAR (50)  NULL,
    [Color]           INT            NULL,
    [AppointmentForm] NVARCHAR (255) NULL,
    CONSTRAINT [pkResID] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [fkResLinkedResource] FOREIGN KEY ([LinkedResource]) REFERENCES [dbo].[Resources] ([ID]),
    CONSTRAINT [fkResMasterID] FOREIGN KEY ([masterID]) REFERENCES [dbo].[Resources] ([ID]),
    CONSTRAINT [fkResUsrID] FOREIGN KEY ([UsrID]) REFERENCES [dbo].[Usr] ([ID])
);

