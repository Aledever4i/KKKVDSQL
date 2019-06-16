﻿CREATE TABLE [dbo].[Form008] (
    [ID]           INT            NOT NULL,
    [MasterID]     INT            NULL,
    [OperNum]      INT            NULL,
    [OperType]     NVARCHAR (50)  NULL,
    [LastName]     NVARCHAR (50)  NULL,
    [FirstName]    NVARCHAR (50)  NULL,
    [SecondName]   NVARCHAR (50)  NULL,
    [MkbDo]        NVARCHAR (100) NULL,
    [CardNum]      INT            NULL,
    [MkbPosle]     NVARCHAR (100) NULL,
    [Narkoz]       NVARCHAR (50)  NULL,
    [MainDoctor]   NVARCHAR (50)  NULL,
    [Assists1]     NVARCHAR (50)  NULL,
    [Assists2]     NVARCHAR (50)  NULL,
    [Assists3]     NVARCHAR (50)  NULL,
    [Narkotizator] NVARCHAR (50)  NULL,
    [OperComment]  NTEXT          NULL,
    [PrepComment]  NTEXT          NULL,
    [OperIshod]    NVARCHAR (50)  NULL,
    [GistIssled]   NTEXT          NULL,
    [Автор]        INT            NULL,
    [Дата]         DATETIME       NULL,
    [PatId]        INT            NULL,
    CONSTRAINT [Form008PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

