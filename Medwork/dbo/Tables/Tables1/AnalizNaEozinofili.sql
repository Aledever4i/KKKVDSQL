CREATE TABLE [dbo].[AnalizNaEozinofili] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [EditBox1]       NVARCHAR (50) NULL,
    [Combo1]         NVARCHAR (50) NULL,
    [EditBox2]       NVARCHAR (8)  NULL,
    [DateBox1]       DATETIME      NULL,
    [Vrach]          INT           NULL,
    [EditBox3]       FLOAT (53)    NULL,
    [EditBox4]       INT           NULL,
    [PredsedatelKek] NVARCHAR (50) NULL,
    CONSTRAINT [AnalizNaEozinofiliPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizNaEozinofiliToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

