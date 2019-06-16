CREATE TABLE [dbo].[DiagPicture] (
    [ID]         INT            NOT NULL,
    [PatID]      INT            NULL,
    [Image]      IMAGE          NULL,
    [Title]      NVARCHAR (100) NULL,
    [Conclusion] NTEXT          NULL,
    [Doctor]     NVARCHAR (50)  NULL,
    [Date]       DATETIME       NULL,
    CONSTRAINT [DiagPicturePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DiagPictureToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

