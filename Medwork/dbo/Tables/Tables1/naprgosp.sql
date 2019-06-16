CREATE TABLE [dbo].[naprgosp] (
    [ID]       INT            NOT NULL,
    [PatID]    INT            NULL,
    [otd]      NVARCHAR (50)  NULL,
    [num]      INT            NULL,
    [date]     DATETIME       NULL,
    [DiagDict] NVARCHAR (50)  NULL,
    [DiagCode] NVARCHAR (6)   NULL,
    [vrach]    NVARCHAR (200) NULL,
    [dateplan] DATETIME       NULL,
    [vrachID]  NVARCHAR (50)  NULL,
    CONSTRAINT [naprgospPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [naprgospToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

