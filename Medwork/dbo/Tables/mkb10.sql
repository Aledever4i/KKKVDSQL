CREATE TABLE [dbo].[mkb10] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [KOD]            NVARCHAR (255) NULL,
    [DNAME]          NVARCHAR (255) NULL,
    [PARENT]         FLOAT (53)     NULL,
    [NODETYPE]       NVARCHAR (8)   NULL,
    [DiagnozPoMkb10] NVARCHAR (80)  NULL,
    [pol]            INT            NULL,
    [deti]           INT            NULL,
    [baz]            INT            NULL,
    [terr]           INT            NULL,
    [nisd]           VARCHAR (10)   NULL,
    [sd]             VARCHAR (10)   NULL,
    [cexp]           VARCHAR (10)   NULL,
    [ostr]           INT            NULL,
    CONSTRAINT [PK_mkb10] PRIMARY KEY CLUSTERED ([ID] ASC)
);

