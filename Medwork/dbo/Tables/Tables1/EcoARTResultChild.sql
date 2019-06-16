CREATE TABLE [dbo].[EcoARTResultChild] (
    [ID]                      INT           NOT NULL,
    [MasterID]                INT           NULL,
    [Sex]                     NVARCHAR (10) NULL,
    [Alive]                   NVARCHAR (3)  NULL,
    [Height]                  FLOAT (53)    NULL,
    [Weight]                  FLOAT (53)    NULL,
    [CongenitalMalformations] NVARCHAR (15) NULL,
    [PerinatalOutcome]        NVARCHAR (20) NULL,
    CONSTRAINT [EcoARTResultChildPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EcoARTResultChildToEcoARTResult] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[EcoARTResult] ([ID]) ON DELETE CASCADE
);

