CREATE TABLE [dbo].[PriemVracha_AllergologaImmunologa_Allergii] (
    [ID]        INT            NOT NULL,
    [PatID]     INT            NULL,
    [NoAllergy] NVARCHAR (50)  NULL,
    [Allergic2] NTEXT          NULL,
    [Allergic4] NTEXT          NULL,
    [Allergic]  NTEXT          NULL,
    [Allergic6] NVARCHAR (255) NULL,
    [Allergic1] NVARCHAR (255) NULL,
    [Allergic3] NVARCHAR (255) NULL,
    [Allergic5] NVARCHAR (255) NULL,
    CONSTRAINT [PriemVracha_AllergologaImmunologa_AllergiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_AllergologaImmunologa_AllergiiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

