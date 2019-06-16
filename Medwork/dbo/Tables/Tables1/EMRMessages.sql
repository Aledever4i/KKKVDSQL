CREATE TABLE [dbo].[EMRMessages] (
    [ID]          UNIQUEIDENTIFIER CONSTRAINT [DF_dbo.EMRMessages_ID] DEFAULT (newid()) NOT NULL,
    [MessageId]   UNIQUEIDENTIFIER NOT NULL,
    [Body]        VARCHAR (MAX)    NOT NULL,
    [IsComplete]  BIT              CONSTRAINT [DF_dbo.EMRMessages_IsComplete] DEFAULT ((0)) NOT NULL,
    [InsertStamp] DATETIME         CONSTRAINT [DF_dbo.EMRMessages_InsertStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_EMRMessages] PRIMARY KEY CLUSTERED ([ID] ASC)
);

