﻿CREATE TABLE [dbo].[AnalizSekretaPredstatelnoyZheleziP] (
    [ID]        INT           NOT NULL,
    [PatID]     INT           NULL,
    [EditBox1]  NVARCHAR (50) NULL,
    [Combo1]    NVARCHAR (50) NULL,
    [EditBox2]  NVARCHAR (8)  NULL,
    [DateBox1]  DATETIME      NULL,
    [Vrach]     INT           NULL,
    [EditBox3]  NVARCHAR (50) NULL,
    [EditBox4]  NVARCHAR (50) NULL,
    [EditBox5]  NVARCHAR (50) NULL,
    [EditBox6]  NVARCHAR (50) NULL,
    [EditBox7]  NVARCHAR (50) NULL,
    [EditBox8]  NVARCHAR (50) NULL,
    [EditBox9]  NVARCHAR (50) NULL,
    [EditBox10] NVARCHAR (50) NULL,
    [EditBox11] NVARCHAR (50) NULL,
    [EditBox12] NVARCHAR (50) NULL,
    [EditBox13] NVARCHAR (50) NULL,
    [EditBox14] NVARCHAR (50) NULL,
    [EditBox15] NVARCHAR (50) NULL,
    [EditBox16] NVARCHAR (50) NULL,
    [EditBox17] NVARCHAR (50) NULL,
    [Vrach2]    INT           NULL,
    CONSTRAINT [AnalizSekretaPredstatelnoyZheleziPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizSekretaPredstatelnoyZheleziPToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

