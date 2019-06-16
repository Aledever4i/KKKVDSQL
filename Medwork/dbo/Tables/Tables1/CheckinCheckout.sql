CREATE TABLE [dbo].[CheckinCheckout] (
    [ID]           INT           NOT NULL,
    [PatID]        INT           NULL,
    [RoomNumberID] INT           NULL,
    [CheckinDate]  DATETIME      NULL,
    [CheckOutDate] DATETIME      NULL,
    [CheckinTime]  DATETIME      NULL,
    [CheckoutTime] DATETIME      NULL,
    [Status]       NVARCHAR (50) NULL,
    CONSTRAINT [CheckinCheckoutPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CheckinCheckoutToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idxCheckinCheckoutDate1]
    ON [dbo].[CheckinCheckout]([CheckinDate] ASC, [CheckoutTime] ASC);


GO
CREATE NONCLUSTERED INDEX [idxCheckinCheckoutDate2]
    ON [dbo].[CheckinCheckout]([CheckoutTime] ASC);

