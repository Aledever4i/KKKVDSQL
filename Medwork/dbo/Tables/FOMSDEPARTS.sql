CREATE TABLE [dbo].[FOMSDEPARTS] (
    [ID]          INT           NOT NULL,
    [DepartId]    INT           NOT NULL,
    [ServiceId]   INT           NOT NULL,
    [ServiceName] VARCHAR (100) NOT NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_FOMSDEPARTS_InsertStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FOMSDEPARTS] PRIMARY KEY CLUSTERED ([ID] ASC)
);

