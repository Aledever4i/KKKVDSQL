CREATE TABLE [dbo].[FOMSOBSLUG] (
    [ID]          INT           NOT NULL,
    [K_PURP]      INT           NOT NULL,
    [I_PURP]      VARCHAR (300) NOT NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_FOMSOBSLUG_InsertStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_dbo.FOMSOBSLUG] PRIMARY KEY CLUSTERED ([ID] ASC)
);

