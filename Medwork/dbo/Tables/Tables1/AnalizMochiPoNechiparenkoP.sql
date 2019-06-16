CREATE TABLE [dbo].[AnalizMochiPoNechiparenkoP] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [EditBox1] NVARCHAR (50) NULL,
    [EditBox2] NVARCHAR (8)  NULL,
    [Combo1]   NVARCHAR (50) NULL,
    [EditBox3] FLOAT (53)    NULL,
    [Vrach]    INT           NULL,
    [DateBox1] DATETIME      NULL,
    [EditBox4] FLOAT (53)    NULL,
    [EditBox5] FLOAT (53)    NULL,
    [EditBox6] NVARCHAR (50) NULL,
    [Vrach2]   INT           NULL,
    CONSTRAINT [AnalizMochiPoNechiparenkoPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizMochiPoNechiparenkoPToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

