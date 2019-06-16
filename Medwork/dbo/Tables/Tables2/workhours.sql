CREATE TABLE [dbo].[workhours] (
    [ID]             INT           NOT NULL,
    [namevrach]      NVARCHAR (50) NULL,
    [polyclinicwork] FLOAT (53)    NULL,
    [month]          INT           NULL,
    [year]           INT           NULL,
    [doctorcode]     INT           NULL,
    [HomeWork]       FLOAT (53)    NULL,
    CONSTRAINT [workhoursPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

