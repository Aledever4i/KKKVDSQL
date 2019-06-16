CREATE TABLE [dbo].[PriemVracha_limfolog] (
    [ID]              INT           NOT NULL,
    [PatID]           INT           NULL,
    [MasterID]        INT           NULL,
    [ObjectiveOsmotr] NTEXT         NULL,
    [PlanLechHands]   NTEXT         NULL,
    [AddStateHands]   NTEXT         NULL,
    [WristPulse]      NVARCHAR (50) NULL,
    [PlanLechFeet]    NTEXT         NULL,
    [AddStateFeet]    NTEXT         NULL,
    [FeetPulse]       NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_limfologPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_limfologToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

