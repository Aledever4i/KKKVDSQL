CREATE TABLE [dbo].[VoennieZabolevaniya] (
    [ID]             INT            NOT NULL,
    [PatID]          INT            NULL,
    [MasterID]       INT            NULL,
    [Data]           DATETIME       NULL,
    [DiagnozPoMkb10] NVARCHAR (100) NULL,
    [DSname]         NVARCHAR (100) NULL,
    CONSTRAINT [VoennieZabolevaniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VoennieZabolevaniyaToDopolnitelnieDannie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[DopolnitelnieDannie] ([ID]) ON DELETE CASCADE
);

