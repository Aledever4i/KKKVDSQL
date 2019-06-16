CREATE VIEW AA_F0103
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL,
       A.DK1D, A.DK2D, A.DK1S, A.DK2S, A.AX1D, A.AX2D, A.AX1S, A.AX2S
FROM [Avtokeratometriya] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
