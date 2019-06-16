﻿CREATE TABLE [dbo].[BESOftalmometriyaPolnostyu] (
    [ID]       INT        NOT NULL,
    [PatID]    INT        NULL,
    [OdCentr]  FLOAT (53) NULL,
    [OsCentr1] FLOAT (53) NULL,
    [OdN1]     FLOAT (53) NULL,
    [OdT1]     FLOAT (53) NULL,
    [OdI1]     FLOAT (53) NULL,
    [OdN2]     FLOAT (53) NULL,
    [OdT2]     FLOAT (53) NULL,
    [OdS2]     FLOAT (53) NULL,
    [OdI2]     FLOAT (53) NULL,
    [OdS4]     FLOAT (53) NULL,
    [OdN3]     FLOAT (53) NULL,
    [OdT3]     FLOAT (53) NULL,
    [OdT4]     FLOAT (53) NULL,
    [OdN4]     FLOAT (53) NULL,
    [OdS3]     FLOAT (53) NULL,
    [OdI3]     FLOAT (53) NULL,
    [OdI4]     FLOAT (53) NULL,
    [OdN5]     FLOAT (53) NULL,
    [OdT5]     FLOAT (53) NULL,
    [OdS6]     FLOAT (53) NULL,
    [OdI5]     FLOAT (53) NULL,
    [OdI6]     FLOAT (53) NULL,
    [OdS5]     FLOAT (53) NULL,
    [OdT6]     FLOAT (53) NULL,
    [OdN6]     FLOAT (53) NULL,
    [OdN7]     FLOAT (53) NULL,
    [OdT7]     FLOAT (53) NULL,
    [OdS7]     FLOAT (53) NULL,
    [OdI7]     FLOAT (53) NULL,
    [OdI8]     FLOAT (53) NULL,
    [OdS8]     FLOAT (53) NULL,
    [OdT8]     FLOAT (53) NULL,
    [OdN8]     FLOAT (53) NULL,
    [OdN9]     FLOAT (53) NULL,
    [OdT9]     FLOAT (53) NULL,
    [OdS10]    FLOAT (53) NULL,
    [OdI9]     FLOAT (53) NULL,
    [OdI10]    FLOAT (53) NULL,
    [OdS9]     FLOAT (53) NULL,
    [OdT10]    FLOAT (53) NULL,
    [OdN10]    FLOAT (53) NULL,
    [OdN11]    FLOAT (53) NULL,
    [OdT11]    FLOAT (53) NULL,
    [OdS11]    FLOAT (53) NULL,
    [OdI11]    FLOAT (53) NULL,
    [OdI12]    FLOAT (53) NULL,
    [OdS12]    FLOAT (53) NULL,
    [OdT12]    FLOAT (53) NULL,
    [OdN12]    FLOAT (53) NULL,
    [OsN1]     FLOAT (53) NULL,
    [OsT1]     FLOAT (53) NULL,
    [OsI1]     FLOAT (53) NULL,
    [OsN2]     FLOAT (53) NULL,
    [OsT2]     FLOAT (53) NULL,
    [OsS2]     FLOAT (53) NULL,
    [OsI2]     FLOAT (53) NULL,
    [OsS4]     FLOAT (53) NULL,
    [OsN3]     FLOAT (53) NULL,
    [OsT3]     FLOAT (53) NULL,
    [OsT4]     FLOAT (53) NULL,
    [OsN4]     FLOAT (53) NULL,
    [OsS3]     FLOAT (53) NULL,
    [OsI3]     FLOAT (53) NULL,
    [OsI4]     FLOAT (53) NULL,
    [OsN5]     FLOAT (53) NULL,
    [OsT5]     FLOAT (53) NULL,
    [OsS6]     FLOAT (53) NULL,
    [OsI5]     FLOAT (53) NULL,
    [OsI6]     FLOAT (53) NULL,
    [OsS5]     FLOAT (53) NULL,
    [OsT6]     FLOAT (53) NULL,
    [OsN6]     FLOAT (53) NULL,
    [OsN7]     FLOAT (53) NULL,
    [OsT7]     FLOAT (53) NULL,
    [OsS7]     FLOAT (53) NULL,
    [OsI7]     FLOAT (53) NULL,
    [OsI8]     FLOAT (53) NULL,
    [OsS8]     FLOAT (53) NULL,
    [OsT8]     FLOAT (53) NULL,
    [OsN8]     FLOAT (53) NULL,
    [OsN9]     FLOAT (53) NULL,
    [OsT9]     FLOAT (53) NULL,
    [OsS10]    FLOAT (53) NULL,
    [OsI9]     FLOAT (53) NULL,
    [OsI10]    FLOAT (53) NULL,
    [OsS9]     FLOAT (53) NULL,
    [OsT10]    FLOAT (53) NULL,
    [OsN10]    FLOAT (53) NULL,
    [OsN11]    FLOAT (53) NULL,
    [OsT11]    FLOAT (53) NULL,
    [OsS11]    FLOAT (53) NULL,
    [OsI11]    FLOAT (53) NULL,
    [OsI12]    FLOAT (53) NULL,
    [OsS12]    FLOAT (53) NULL,
    [OsT12]    FLOAT (53) NULL,
    [OsN12]    FLOAT (53) NULL,
    [OsS1]     FLOAT (53) NULL,
    [OdS1]     FLOAT (53) NULL,
    [Prim]     NTEXT      NULL,
    CONSTRAINT [BESOftalmometriyaPolnostyuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BESOftalmometriyaPolnostyuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
