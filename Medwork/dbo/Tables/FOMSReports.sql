CREATE TABLE dbo.FOMSReports
(
    ID int IDENTITY (1, 1) NOT NULL,
    [Header]     VARCHAR (MAX) NULL,
    [IsActive]   BIT           CONSTRAINT [DF_FOMSReports_IsActive] DEFAULT ((0)) NOT NULL,
    [IsClose]    BIT           NULL,
    [ReportDate] DATETIME      NULL,
    [HM]         VARCHAR (MAX) NULL,
    [PM]         VARCHAR (MAX) NULL,
    [LM]         VARCHAR (MAX) NULL,
    [EditStamp]  DATETIME      NULL,
    [Comment]    NTEXT         NULL,
    IsImport bit NULL DEFAULT (0),
    CONSTRAINT [PK_FOMSReports] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_FOMSReports_PatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID])
);

