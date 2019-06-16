CREATE TABLE [dbo].[KlinicheskiyAnalizUniversalniy] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [Combo1]   NVARCHAR (50) NULL,
    [EditBox1] NVARCHAR (50) NULL,
    [EditBox2] NVARCHAR (8)  NULL,
    [DateBox1] DATETIME      NULL,
    [Vrach]    INT           NULL,
    [Memo1]    NTEXT         NULL,
    [EditBox3] NVARCHAR (50) NULL,
    [Vrach2]   INT           NULL,
    CONSTRAINT [KlinicheskiyAnalizUniversalniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KlinicheskiyAnalizUniversalniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

