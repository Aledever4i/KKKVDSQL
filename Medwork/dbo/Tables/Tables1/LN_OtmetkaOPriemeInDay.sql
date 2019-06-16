CREATE TABLE [dbo].[LN_OtmetkaOPriemeInDay] (
    [ID]                INT          NOT NULL,
    [PatID]             INT          NULL,
    [MasterID]          INT          NULL,
    [Avtor]             INT          NULL,
    [Type]              INT          NULL,
    [LekarstvoPrinyato] NVARCHAR (1) NULL,
    [Time]              DATETIME     NULL,
    CONSTRAINT [LN_OtmetkaOPriemeInDayPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LN_OtmetkaOPriemeInDayToLN_OtmetkaOPrieme] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LN_OtmetkaOPrieme] ([ID]) ON DELETE CASCADE
);

