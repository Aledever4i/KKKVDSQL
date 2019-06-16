CREATE TABLE [dbo].[OrgWorkPlaces] (
    [ID]        INT      NOT NULL,
    [MasterID]  INT      NULL,
    [StartDate] DATETIME NULL,
    [NWorkersM] INT      NULL,
    [NWorkersF] INT      NULL,
    [NWorkers]  INT      NULL,
    CONSTRAINT [OrgWorkPlacesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OrgWorkPlacesToOrgDept] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[OrgDept] ([ID]) ON DELETE CASCADE
);

