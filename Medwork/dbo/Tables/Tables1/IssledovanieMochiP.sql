﻿CREATE TABLE [dbo].[IssledovanieMochiP] (
    [ID]                     INT           NOT NULL,
    [PatID]                  INT           NULL,
    [NomerAnaliza]           INT           NULL,
    [EditBox3]               NVARCHAR (50) NULL,
    [Combo1]                 NVARCHAR (50) NULL,
    [Vrach]                  INT           NULL,
    [DataProvedeniyaAnaliza] DATETIME      NULL,
    [EditBox2]               NVARCHAR (8)  NULL,
    [EditBox1]               FLOAT (53)    NULL,
    [Combo2]                 NVARCHAR (50) NULL,
    [EditBox4]               NVARCHAR (50) NULL,
    [EditBox5]               FLOAT (53)    NULL,
    [Combo3]                 NVARCHAR (50) NULL,
    [EditBox6]               NVARCHAR (50) NULL,
    [EditBox7]               NVARCHAR (50) NULL,
    [EditBox8]               FLOAT (53)    NULL,
    [EditBox9]               FLOAT (53)    NULL,
    [EditBox10]              FLOAT (53)    NULL,
    [EditBox11]              NVARCHAR (50) NULL,
    [EditBox12]              NVARCHAR (50) NULL,
    [EditBox13]              NVARCHAR (50) NULL,
    [Sliz]                   INT           NULL,
    [EditBox14]              INT           NULL,
    [EditBox15]              INT           NULL,
    [EditBox16]              INT           NULL,
    [EditBox17]              INT           NULL,
    [EditBox18]              INT           NULL,
    [EditBox19]              INT           NULL,
    [EditBox20]              INT           NULL,
    [EditBox21]              INT           NULL,
    [EditBox22]              INT           NULL,
    [Vrach2]                 INT           NULL,
    [EditBox25]              INT           NULL,
    [EditBox23]              INT           NULL,
    CONSTRAINT [IssledovanieMochiPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IssledovanieMochiPToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
