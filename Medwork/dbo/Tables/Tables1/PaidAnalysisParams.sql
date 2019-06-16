CREATE TABLE [dbo].[PaidAnalysisParams] (
    [ID]           INT            NOT NULL,
    [MasterID]     INT            NULL,
    [ParamName]    NVARCHAR (50)  NULL,
    [Values]       NTEXT          NULL,
    [Code]         NVARCHAR (50)  NULL,
    [ItemType]     INT            NULL,
    [ParamCaption] NVARCHAR (50)  NULL,
    [Reference]    NVARCHAR (500) NULL,
    [Measure]      NVARCHAR (50)  NULL,
    [DictPath]     NVARCHAR (50)  NULL,
    [DictURL]      NVARCHAR (50)  NULL,
    [NormMin]      VARCHAR (50)   NULL,
    [NormMax]      VARCHAR (50)   NULL
);

