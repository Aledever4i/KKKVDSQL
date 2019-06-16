CREATE TABLE [dbo].[CityLab_bioMaterial] (
    [id]                 INT           NULL,
    [pid]                INT           NULL,
    [engName]            VARCHAR (500) NULL,
    [name]               VARCHAR (MAX) NULL,
    [code]               VARCHAR (50)  NULL,
    [mnemonics]          VARCHAR (100) NULL,
    [removed]            BIT           NULL,
    [storageTemperature] FLOAT (53)    NULL,
    [storageDuration]    INT           NULL,
    [description]        VARCHAR (MAX) NULL
);

