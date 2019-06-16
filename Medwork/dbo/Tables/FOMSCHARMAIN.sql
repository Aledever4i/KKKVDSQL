CREATE TABLE [dbo].[FOMSCHARMAIN] (
    [ID]          INT           NOT NULL,
    [K_CHAR]      INT           NOT NULL,
    [I_CHAR]      VARCHAR (200) NOT NULL,
    [IsActive]    BIT           CONSTRAINT [DF_FOMSCHARMAIN_IsActive] DEFAULT ((0)) NOT NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_FOMSCHARMAIN_InsertStamp] DEFAULT (getdate()) NOT NULL
);

