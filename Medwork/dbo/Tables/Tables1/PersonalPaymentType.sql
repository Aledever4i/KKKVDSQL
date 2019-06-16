CREATE TABLE [dbo].[PersonalPaymentType] (
    [ID]          INT           NOT NULL,
    [PaymentType] NVARCHAR (50) NULL,
    [MayReturn]   BIT           NULL,
    CONSTRAINT [PersonalPaymentTypePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

