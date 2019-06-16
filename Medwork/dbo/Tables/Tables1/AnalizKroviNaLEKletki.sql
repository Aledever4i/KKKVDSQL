CREATE TABLE [dbo].[AnalizKroviNaLEKletki] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [EditBox1] NVARCHAR (50) NULL,
    [EditBox2] NVARCHAR (8)  NULL,
    [Combo1]   NVARCHAR (50) NULL,
    [DateBox1] DATETIME      NULL,
    [Vrach]    INT           NULL,
    [Combo2]   NVARCHAR (50) NULL,
    [EditBox3] NVARCHAR (50) NULL,
    [Vrach2]   INT           NULL,
    [EditBox4] NVARCHAR (50) NULL,
    CONSTRAINT [AnalizKroviNaLEKletkiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizKroviNaLEKletkiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

