CREATE TABLE [dbo].[PolicyType] (
    [ID]                INT           NOT NULL,
    [Name]              VARCHAR (50)  NULL,
    [SeriesName]        VARCHAR (50)  NULL,
    [NumberName]        VARCHAR (50)  NULL,
    [AllowSeriesSelect] BIT           NULL,
    [DictReference]     VARCHAR (200) NULL,
    [Assignments]       VARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

