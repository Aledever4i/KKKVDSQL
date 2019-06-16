CREATE TABLE [dbo].[ZabolevaniyaPodlezhashieDispansernomuNablyudeniyu] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [ZabolevaniyaPodlezhashieDispansernomuNablyudeniyuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ZabolevaniyaPodlezhashieDispansernomuNablyudeniyuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

