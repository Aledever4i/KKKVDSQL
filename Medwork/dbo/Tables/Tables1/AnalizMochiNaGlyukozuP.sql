CREATE TABLE [dbo].[AnalizMochiNaGlyukozuP] (
    [ID]            INT           NOT NULL,
    [PatID]         INT           NULL,
    [MasterID]      INT           NULL,
    [Kolichestvo]   FLOAT (53)    NULL,
    [UdelniyVes]    FLOAT (53)    NULL,
    [ProcentSahara] FLOAT (53)    NULL,
    [EditBox1]      NVARCHAR (50) NULL,
    [Combo1]        NVARCHAR (50) NULL,
    [EditBox2]      NVARCHAR (8)  NULL,
    [DateBox1]      DATETIME      NULL,
    [Vrach]         INT           NULL,
    [EditBox3]      NVARCHAR (50) NULL,
    [Vrach2]        INT           NULL,
    CONSTRAINT [AnalizMochiNaGlyukozuPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizMochiNaGlyukozuPToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

