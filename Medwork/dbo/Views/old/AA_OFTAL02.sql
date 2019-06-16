CREATE VIEW AA_OFTAL02
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL, B.KODOPER, B.KODBRIG, B.DATOTCH
  ,RIGHT(LEFT(B.service,4),2) AS KODUSL
  ,left(B.PatStatus,1) AS [PP]
  ,A.[PD1OD]
  ,A.[PD2OD]
  ,A.[PD3OD]
  ,A.[PD4OD]
  ,A.[PD1OS]
  ,A.[PD2OS]
  ,A.[PD3OS]
  ,A.[PD4OS]
  ,A.[KODZAKOD]
  ,A.[KODZAKOS]
  ,A.[FIBROOD]
  ,A.[FIBROOS]
  ,A.[POMOD]
  ,A.[POMOS]
  ,A.[COMMEN]
FROM [ZaklyuchenieVrachaOftalmologa] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
