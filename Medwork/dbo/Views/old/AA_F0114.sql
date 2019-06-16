CREATE VIEW AA_F0114
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL,
        A.PD, A.CD, A.FD, A.PCD, A.PS, A.CS, A.FS, A.PCS
FROM [Tonografiya] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
