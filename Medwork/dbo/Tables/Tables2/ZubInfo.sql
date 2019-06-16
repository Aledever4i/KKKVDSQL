CREATE TABLE [dbo].[ZubInfo] (
    [ID]              INT           NOT NULL,
    [MasterID]        INT           NULL,
    [FormulaZuba]     NVARCHAR (10) NULL,
    [NomerZuba]       INT           NULL,
    [DiagDictCombo]   NVARCHAR (50) NULL,
    [DiagCode]        NVARCHAR (6)  NULL,
    [Recommendations] NTEXT         NULL,
    CONSTRAINT [ZubInfoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ZubInfoToPovtorniyPriMStomatologa] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PovtorniyPriMStomatologa] ([ID]) ON DELETE CASCADE
);

