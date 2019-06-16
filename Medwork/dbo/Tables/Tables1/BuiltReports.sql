CREATE TABLE [dbo].[BuiltReports] (
    [id]               UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportInstanceID] UNIQUEIDENTIFIER NULL,
    [ReportTypeID]     UNIQUEIDENTIFIER NULL,
    [BuildTime]        DATETIME         NULL,
    [DataKind]         VARCHAR (50)     NULL,
    [Data]             IMAGE            NULL,
    [UserID]           INT              NULL,
    [DataStr]          NTEXT            NULL,
    [Comment]          VARCHAR (255)    NULL,
    CONSTRAINT [PK_BuiltReports] PRIMARY KEY CLUSTERED ([id] ASC)
);

