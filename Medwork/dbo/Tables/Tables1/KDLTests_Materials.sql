CREATE TABLE [dbo].[KDLTests_Materials] (
    [ID]              INT             NOT NULL,
    [MasterID]        INT             NOT NULL,
    [container]       NVARCHAR (20)   NULL,
    [container_code]  VARCHAR (10)    NULL,
    [biomatlocus]     NVARCHAR (255)  NULL,
    [locus_code]      VARCHAR (20)    NULL,
    [term]            VARCHAR (20)    NULL,
    [required_k_data] NVARCHAR (1000) NULL,
    CONSTRAINT [KDLTests_MaterialsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [KDLTests_MaterialsMasterIDIdx]
    ON [dbo].[KDLTests_Materials]([MasterID] ASC);


GO
CREATE NONCLUSTERED INDEX [KDLTests_MaterialsLocusIdx]
    ON [dbo].[KDLTests_Materials]([locus_code] ASC);

