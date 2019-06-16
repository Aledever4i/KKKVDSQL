CREATE VIEW AA_F0123
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL,
       A.CylD, A.VisD, A.VisS, A.CylS, A.AxD, A.AxS, A.SphD, A.SphS, A.VisKD, A.VisKS
FROM [OstrotaZreniya] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
