CREATE TABLE [dbo].[CashOrder] (
    [ID]              INT            NOT NULL,
    [Coment]          NVARCHAR (100) NULL,
    [summa]           MONEY          NULL,
    [Date]            DATETIME       NULL,
    [PaymentCode]     INT            NULL,
    [Author]          INT            NULL,
    [DocNumber]       NVARCHAR (50)  NULL,
    [DocType]         INT            NULL,
    [coNum]           INT            DEFAULT ((0)) NULL,
    [Cash]            INT            NULL,
    [Type]            INT            NULL,
    [Kateg]           INT            NULL,
    [Vremya]          DATETIME       NULL,
    [VydanoPolucheno] NVARCHAR (30)  NULL,
    CONSTRAINT [CashOrderPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

