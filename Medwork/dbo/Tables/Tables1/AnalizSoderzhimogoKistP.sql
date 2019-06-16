CREATE TABLE [dbo].[AnalizSoderzhimogoKistP] (
    [ID]                     INT           NOT NULL,
    [PatID]                  INT           NULL,
    [NomerAnaliza]           INT           NULL,
    [EditBox3]               NVARCHAR (50) NULL,
    [Combo1]                 NVARCHAR (50) NULL,
    [Vrach]                  INT           NULL,
    [DataProvedeniyaAnaliza] DATETIME      NULL,
    [EditBox2]               NVARCHAR (8)  NULL,
    [EditBox1]               FLOAT (53)    NULL,
    [EditBox4]               NVARCHAR (50) NULL,
    [EditBox5]               NVARCHAR (50) NULL,
    [EditBox6]               FLOAT (53)    NULL,
    [EditBox7]               NVARCHAR (50) NULL,
    [EditBox8]               FLOAT (53)    NULL,
    [EditBox9]               NVARCHAR (50) NULL,
    [Memo1]                  NTEXT         NULL,
    [Vrach2]                 INT           NULL,
    CONSTRAINT [AnalizSoderzhimogoKistPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizSoderzhimogoKistPToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

