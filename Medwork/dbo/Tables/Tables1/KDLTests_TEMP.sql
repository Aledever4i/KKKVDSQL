CREATE TABLE [dbo].[KDLTests_TEMP] (
    [ID]              INT             NOT NULL,
    [code]            NVARCHAR (50)   NULL,
    [Name]            NVARCHAR (1500) NOT NULL,
    [container]       NVARCHAR (20)   NULL,
    [container_code]  VARCHAR (10)    NULL,
    [biomatlocus]     NVARCHAR (255)  NULL,
    [locus_code]      VARCHAR (20)    NULL,
    [term]            VARCHAR (20)    NULL,
    [required_k_data] NVARCHAR (1000) NULL,
    CONSTRAINT [KDLTests_TEMPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

