CREATE TABLE [dbo].[KerDict] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [type]    INT           NOT NULL,
    [Text]    VARCHAR (100) NOT NULL,
    [MinBall] TINYINT       NULL,
    [MaxBall] TINYINT       NULL,
    CONSTRAINT [PK_KerDict] PRIMARY KEY CLUSTERED ([id] ASC)
);

