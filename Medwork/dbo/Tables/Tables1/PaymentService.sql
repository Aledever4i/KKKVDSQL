CREATE TABLE [dbo].[PaymentService] (
    [ID]          INT            NOT NULL,
    [PaymentID]   INT            NOT NULL,
    [ServiceID]   INT            NOT NULL,
    [ServiceName] NVARCHAR (255) NULL,
    [Service]     NVARCHAR (50)  NULL,
    [Quant]       INT            NULL,
    [Price]       MONEY          NULL,
    [Summa]       MONEY          NULL,
    CONSTRAINT [PK_PaymentService] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PaymentService_Payment] FOREIGN KEY ([PaymentID]) REFERENCES [dbo].[Payment] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [PaymentServicePaymentID]
    ON [dbo].[PaymentService]([PaymentID] ASC);

