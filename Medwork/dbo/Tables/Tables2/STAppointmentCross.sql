CREATE TABLE [dbo].[STAppointmentCross] (
    [ID]             INT  IDENTITY (1, 1) NOT NULL,
    [MasterID]       INT  NULL,
    [AppointmentId]  INT  NULL,
    [Statistictalon] INT  NULL,
    [InsertStamp]    DATE CONSTRAINT [DF_STAppointmentCross_InsertStamp] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_STAppointmentCross] PRIMARY KEY CLUSTERED ([ID] ASC)
);

