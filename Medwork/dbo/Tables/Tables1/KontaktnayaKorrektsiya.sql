CREATE TABLE [dbo].[KontaktnayaKorrektsiya] (
    [ID]        INT           NOT NULL,
    [PatID]     INT           NULL,
    [EditBox13] NVARCHAR (50) NULL,
    [EditBox1]  NVARCHAR (50) NULL,
    [EditBox7]  NVARCHAR (50) NULL,
    [EditBox2]  NVARCHAR (50) NULL,
    [EditBox8]  NVARCHAR (50) NULL,
    [EditBox3]  NVARCHAR (50) NULL,
    [EditBox9]  NVARCHAR (50) NULL,
    [EditBox5]  NVARCHAR (50) NULL,
    [EditBox10] NVARCHAR (50) NULL,
    [EditBox6]  NVARCHAR (50) NULL,
    [EditBox11] NVARCHAR (50) NULL,
    [EditBox4]  NVARCHAR (50) NULL,
    [EditBox12] NVARCHAR (50) NULL,
    CONSTRAINT [KontaktnayaKorrektsiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KontaktnayaKorrektsiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

