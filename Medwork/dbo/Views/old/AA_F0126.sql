CREATE VIEW AA_F0126
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL,
       A.[PZOD], A.[PZOS]
FROM [KompyuternayaPerimetriya] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
