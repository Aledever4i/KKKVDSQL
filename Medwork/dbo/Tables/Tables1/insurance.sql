CREATE TABLE [dbo].[insurance] (
    [ID]           INT           NOT NULL,
    [Name]         NVARCHAR (50) NULL,
    [Income]       FLOAT (53)    NULL,
    [Dogovor]      NVARCHAR (50) NULL,
    [DataDogovora] DATETIME      NULL,
    [NodeType]     NVARCHAR (12) NULL,
    [Info]         NTEXT         NULL,
    [Tip]          NVARCHAR (40) NULL,
    CONSTRAINT [insurancePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

