CREATE TABLE [dbo].[RezultatiBiometrii] (
    [ID]           INT           NOT NULL,
    [PatID]        INT           NULL,
    [DateBox1]     DATETIME      NULL,
    [DictCombo1]   NVARCHAR (50) NULL,
    [As]           INT           NULL,
    [As1]          INT           NULL,
    [Lens]         INT           NULL,
    [Lens1]        INT           NULL,
    [AL]           NVARCHAR (50) NULL,
    [AL1]          NVARCHAR (50) NULL,
    [PoTsentru]    NVARCHAR (1)  NULL,
    [PoTsentru1]   NVARCHAR (50) NULL,
    [DopolnSignal] NVARCHAR (50) NULL,
    [PoOrbite]     NVARCHAR (1)  NULL,
    [DictCombo2]   NVARCHAR (50) NULL,
    [tri]          NVARCHAR (1)  NULL,
    [shest]        NVARCHAR (1)  NULL,
    [devat]        NVARCHAR (1)  NULL,
    [dvenazat]     NVARCHAR (1)  NULL,
    CONSTRAINT [RezultatiBiometriiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RezultatiBiometriiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

