CREATE TABLE [dbo].[KLADR] (
    [name]  VARCHAR (40) NOT NULL,
    [socr]  CHAR (10)    NOT NULL,
    [code]  CHAR (13)    NOT NULL,
    [name3] CHAR (40)    NULL
);


GO
CREATE NONCLUSTERED INDEX [idxKladrCode]
    ON [dbo].[KLADR]([code] ASC);

