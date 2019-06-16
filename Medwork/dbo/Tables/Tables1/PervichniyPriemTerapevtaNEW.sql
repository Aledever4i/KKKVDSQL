﻿CREATE TABLE [dbo].[PervichniyPriemTerapevtaNEW] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [Memo1]          NTEXT         NULL,
    [Memo2]          NTEXT         NULL,
    [Memo3]          NTEXT         NULL,
    [Memo4]          NTEXT         NULL,
    [Memo5]          NTEXT         NULL,
    [Memo6]          NTEXT         NULL,
    [Memo7]          NTEXT         NULL,
    [Memo8]          NTEXT         NULL,
    [Memo9]          NTEXT         NULL,
    [Memo10]         NTEXT         NULL,
    [DiagnozPoMkb10] NVARCHAR (50) NULL,
    [Memo11]         NTEXT         NULL,
    [Memo12]         NTEXT         NULL,
    [Memo13]         NTEXT         NULL,
    [Memo14]         NTEXT         NULL,
    [EditBox1]       NVARCHAR (50) NULL,
    [DateBox1]       DATETIME      NULL,
    [DateBox2]       DATETIME      NULL,
    [DateBox3]       DATETIME      NULL,
    [EditBox2]       NVARCHAR (50) NULL,
    [DateBox4]       DATETIME      NULL,
    [Memo15]         NTEXT         NULL,
    [DateBox5]       DATETIME      NULL,
    [Kurenie]        NVARCHAR (1)  NULL,
    [Alkogol]        NVARCHAR (1)  NULL,
    [Narkotiki]      NVARCHAR (1)  NULL,
    [Combo1]         NVARCHAR (50) NULL,
    CONSTRAINT [PervichniyPriemTerapevtaNEWPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PervichniyPriemTerapevtaNEWToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

