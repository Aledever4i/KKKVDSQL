CREATE TABLE [dbo].[LimfologicheskiyStatus] (
    [ID]       INT           NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [Vrv]      BIT           NULL,
    [Limfr]    BIT           NULL,
    [Tya]      BIT           NULL,
    [Dermatit] BIT           NULL,
    [Fibroz]   BIT           NULL,
    [Otek]     BIT           NULL,
    [Volume]   NVARCHAR (50) NULL,
    [PlaceID]  INT           NULL,
    [Place2ID] INT           NULL,
    CONSTRAINT [FK_LimfologicheskiyStatus_LimfStatusPlaces] FOREIGN KEY ([PlaceID]) REFERENCES [dbo].[LimfStatusPlaces] ([id]),
    CONSTRAINT [FK_LimfologicheskiyStatus_LimfStatusPlaces1] FOREIGN KEY ([Place2ID]) REFERENCES [dbo].[LimfStatusPlaces] ([id]),
    CONSTRAINT [LimfologicheskiyStatusToFlebologExam] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PriemVracha_limfolog] ([ID]) ON DELETE CASCADE
);

