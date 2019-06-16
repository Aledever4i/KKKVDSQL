CREATE TABLE [dbo].[RemoteConnection] (
    [ID]           INT            NOT NULL,
    [MasterID]     INT            NULL,
    [Name]         NVARCHAR (50)  NULL,
    [ConnString]   NVARCHAR (200) NULL,
    [SrvName]      NVARCHAR (50)  NULL,
    [DBName]       NVARCHAR (50)  NULL,
    [Login]        NVARCHAR (50)  NULL,
    [Password]     NVARCHAR (50)  NULL,
    [LinkSrvName]  NVARCHAR (50)  NULL,
    [ConnType]     NVARCHAR (20)  NULL,
    [is_linked]    BIT            NULL,
    [RDPFile]      NVARCHAR (200) NULL,
    [UploadFile]   NVARCHAR (200) NULL,
    [DefaultConn]  INT            NULL,
    [EnableSearch] BIT            NULL,
    CONSTRAINT [RemoteConnectionPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

