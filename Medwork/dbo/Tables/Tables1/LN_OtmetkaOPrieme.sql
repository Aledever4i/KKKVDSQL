CREATE TABLE [dbo].[LN_OtmetkaOPrieme] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [Date]     DATETIME      NULL,
    [Coment]   NVARCHAR (20) NULL,
    [Vazhno]   NVARCHAR (1)  NULL,
    [Type]     INT           NULL,
    [Time]     DATETIME      NULL,
    [Avtor]    INT           NULL,
    [Time_End] DATETIME      NULL,
    [RealTime] DATETIME      NULL,
    [RealType] INT           NULL,
    [Status]   INT           NULL,
    [Duration] INT           NULL,
    [Resource] INT           NULL,
    CONSTRAINT [LN_OtmetkaOPriemePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LN_OtmetkaOPriemeToLN_Naznacheniya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LN_Naznacheniya] ([ID]) ON DELETE CASCADE
);

