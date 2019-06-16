CREATE TABLE [dbo].[EMRErrorMessages] (
    [RecId]        UNIQUEIDENTIFIER CONSTRAINT [DF_EMRErrorMessages_RecId] DEFAULT (newid()) NOT NULL,
    [ErrorMessage] VARCHAR (MAX)    NOT NULL,
    [InsertStamp]  DATETIME         CONSTRAINT [DF_EMRErrorMessages_InsertStamp] DEFAULT (getdate()) NOT NULL,
    [IsResponse]   BIT              CONSTRAINT [DF_EMRErrorMessages_IsResponse] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_EMRErrorMessages] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

