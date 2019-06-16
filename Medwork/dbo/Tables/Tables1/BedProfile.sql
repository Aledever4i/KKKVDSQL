CREATE TABLE [dbo].[BedProfile] (
    [ID]          INT           NOT NULL,
    [ProfileName] NVARCHAR (50) NULL,
    [Kod]         INT           NULL,
    CONSTRAINT [BedProfilePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

