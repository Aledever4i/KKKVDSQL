CREATE TABLE [dbo].[UD_Payment] (
    [ID]       INT           NOT NULL,
    [Org]      INT           NULL,
    [Date]     DATETIME      NULL,
    [Dog]      INT           NULL,
    [Summa]    MONEY         NULL,
    [Nomer]    NVARCHAR (50) NULL,
    [Schet]    INT           NULL,
    [SchetAkt] INT           NULL,
    CONSTRAINT [UD_PaymentPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [UD_Payment_Schet_idx]
    ON [dbo].[UD_Payment]([Schet] ASC);

