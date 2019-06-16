CREATE TABLE [dbo].[CityLab_Service] (
    [id]             INT            NULL,
    [duration]       INT            NULL,
    [workingDays]    INT            NULL,
    [exportCode]     VARCHAR (100)  NULL,
    [urgentDuration] INT            NULL,
    [biomat_code]    VARCHAR (50)   NULL,
    [engName]        VARCHAR (500)  NULL,
    [name]           NVARCHAR (MAX) NULL,
    [code]           VARCHAR (50)   NULL,
    [mnemonics]      VARCHAR (100)  NULL,
    [removed]        BIT            NULL,
    [pid]            INT            NULL
);

