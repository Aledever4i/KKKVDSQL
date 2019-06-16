CREATE TABLE [dbo].[b_karta_states] (
    [ID]        INT           NOT NULL,
    [BriefName] NVARCHAR (20) NULL,
    [Name]      NVARCHAR (50) NULL,
    CONSTRAINT [b_karta_statesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

