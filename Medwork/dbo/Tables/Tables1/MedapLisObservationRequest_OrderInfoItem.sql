CREATE TABLE [dbo].[MedapLisObservationRequest_OrderInfoItem] (
    [ID]          INT            NOT NULL,
    [MasterID]    INT            NULL,
    [ServiceCode] NVARCHAR (50)  NULL,
    [Service]     NVARCHAR (512) NULL,
    [ServiceID]   NVARCHAR (50)  NULL,
    CONSTRAINT [MedapLisObservationRequest_OrderInfoItemPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [MedapLisObservationRequest_OrderInfoItemToMedapLisObservationRequest] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[MedapLisObservationRequest] ([ID]) ON DELETE CASCADE
);

