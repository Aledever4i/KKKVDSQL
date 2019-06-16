CREATE TABLE [dbo].[CityLab_Target] (
    [id]                 INT            NULL,
    [targetType]         INT            NULL,
    [department]         INT            NULL,
    [defaultBiomaterial] INT            NULL,
    [needPrint]          BIT            NULL,
    [transparentPrint]   BIT            NULL,
    [doctorLoad]         FLOAT (53)     NULL,
    [labAssistLoad]      FLOAT (53)     NULL,
    [registLoad]         FLOAT (53)     NULL,
    [cito]               BIT            NULL,
    [cancelled]          BIT            NULL,
    [engName]            VARCHAR (500)  NULL,
    [name]               NVARCHAR (MAX) NULL,
    [description]        NVARCHAR (MAX) NULL,
    [code]               VARCHAR (50)   NULL,
    [mnemonics]          VARCHAR (100)  NULL,
    [removed]            BIT            NULL,
    [pid]                INT            NULL
);

