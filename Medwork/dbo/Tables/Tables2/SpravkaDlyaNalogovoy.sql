CREATE TABLE [dbo].[SpravkaDlyaNalogovoy] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [MasterID]   INT           NULL,
    [EditBox1]   NVARCHAR (50) NULL,
    [EditBox2]   NVARCHAR (50) NULL,
    [EditBox3]   NVARCHAR (50) NULL,
    [EditBox4]   NVARCHAR (50) NULL,
    [EditBox5]   NVARCHAR (50) NULL,
    [EditBox6]   NVARCHAR (50) NULL,
    [EditBox7]   NVARCHAR (50) NULL,
    [DateBox1]   DATETIME      NULL,
    [DateBox2]   DATETIME      NULL,
    [Combo1]     NVARCHAR (50) NULL,
    [EditBox8]   NVARCHAR (50) NULL,
    [EditBox9]   NVARCHAR (50) NULL,
    [EditBox10]  NVARCHAR (50) NULL,
    [FIOPacient] NVARCHAR (50) NULL,
    [FIONalog]   NVARCHAR (50) NULL,
    [DataOplati] DATETIME      NULL,
    CONSTRAINT [SpravkaDlyaNalogovoyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SpravkaDlyaNalogovoyToBill] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Bill] ([ID]) ON DELETE CASCADE
);

