CREATE TABLE [dbo].[Visitsplan] (
    [ID]             INT           NOT NULL,
    [Homeplan]       INT           NULL,
    [Polyclinicplan] INT           NULL,
    [Doctorcode]     INT           NULL,
    [Month]          INT           NULL,
    [Year]           INT           NULL,
    [namevrach]      NVARCHAR (50) NULL,
    CONSTRAINT [visitsplanPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

