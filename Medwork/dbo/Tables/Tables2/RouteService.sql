CREATE TABLE [dbo].[RouteService] (
    [ID]            INT            NOT NULL,
    [MasterID]      INT            NULL,
    [Service]       NVARCHAR (20)  NULL,
    [ServiceName]   NVARCHAR (250) NULL,
    [AppointmentID] INT            NULL,
    [ServiceID]     INT            NULL,
    CONSTRAINT [RouteServicePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RouteServiceToRoute] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Route] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idxRouteService_AppointmentID]
    ON [dbo].[RouteService]([AppointmentID] ASC);

