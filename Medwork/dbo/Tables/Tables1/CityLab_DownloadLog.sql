CREATE TABLE [dbo].[CityLab_DownloadLog] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [start_date]  SMALLDATETIME NULL,
    [finish_date] SMALLDATETIME NULL,
    [timestamp]   INT           NULL,
    [state]       TINYINT       NULL
);

