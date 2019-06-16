CREATE TABLE [dbo].[IssuedNumerSeriya] (
    [ID]          INT           NOT NULL,
    [PatID]       INT           NULL,
    [MasterID]    INT           NOT NULL,
    [OGRN]        NVARCHAR (13) NULL,
    [DataVydachi] DATETIME      NULL,
    [AuthorID]    INT           NULL,
    [TypeDoc]     INT           NULL,
    [Seriya]      NVARCHAR (20) NULL,
    [Numer]       NVARCHAR (15) NULL,
    CONSTRAINT [IssuedNumerSeriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

