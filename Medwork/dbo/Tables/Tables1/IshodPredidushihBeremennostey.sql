CREATE TABLE [dbo].[IshodPredidushihBeremennostey] (
    [ID]                 INT           NOT NULL,
    [PatID]              INT           NULL,
    [MasterID]           INT           NULL,
    [NumPP]              INT           NULL,
    [ChildLiveStatus]    NVARCHAR (50) NULL,
    [ChildBornCondition] NVARCHAR (50) NULL,
    [ChildMass]          FLOAT (53)    NULL,
    [ChildDeathAge]      FLOAT (53)    NULL,
    [PregResult]         NVARCHAR (24) NULL,
    [PregDate]           DATETIME      NULL,
    [PregDuration]       INT           NULL,
    [Features]           NTEXT         NULL,
    [Rost]               FLOAT (53)    NULL,
    CONSTRAINT [IshodPredidushihBeremennosteyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IshodPredidushihBeremennosteyToPerviyVizitBeremennoy] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PerviyVizitBeremennoy] ([ID]) ON DELETE CASCADE
);

