CREATE TABLE [dbo].[PrichiniOtkrepleniya] (
    [ID]       INT            NOT NULL,
    [Prichina] NVARCHAR (100) NULL,
    [Type]     INT            NULL,
    CONSTRAINT [PrichiniOtkrepleniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

