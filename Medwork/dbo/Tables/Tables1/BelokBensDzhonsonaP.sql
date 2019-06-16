CREATE TABLE [dbo].[BelokBensDzhonsonaP] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [EditBox1]       NVARCHAR (50) NULL,
    [Combo1]         NVARCHAR (50) NULL,
    [EditBox2]       NVARCHAR (8)  NULL,
    [DateBox1]       DATETIME      NULL,
    [Vrach]          INT           NULL,
    [Combo2]         NVARCHAR (50) NULL,
    [EditBox3]       INT           NULL,
    [PredsedatelKek] NVARCHAR (50) NULL,
    CONSTRAINT [BelokBensDzhonsonaPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BelokBensDzhonsonaPToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

