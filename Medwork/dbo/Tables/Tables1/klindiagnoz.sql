CREATE TABLE [dbo].[klindiagnoz] (
    [ID]       INT            NOT NULL,
    [KOD]      NVARCHAR (7)   NULL,
    [DNAME]    NVARCHAR (222) NULL,
    [PARENT]   FLOAT (53)     NULL,
    [NODETYPE] NVARCHAR (8)   NULL,
    CONSTRAINT [PK_klindiagnoz] PRIMARY KEY CLUSTERED ([ID] ASC)
);

