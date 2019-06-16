
CREATE VIEW [dbo].[check_patientid_temporary]
AS
SELECT     COUNT(id) AS id
FROM         dbo.PatientId_temporary
WHERE     (RegDate IS NULL)
UNION ALL
SELECT     COUNT(ISNULL(id, 0)) AS Expr1
FROM         dbo.PatientId_temporary AS PatientId_temporary_5
WHERE     (id IS NULL) OR
                      (FirstName IS NULL) OR
                      (FirstName = '') OR
                      (SecondName IS NULL) OR
                      (SecondName = '') OR
                      (LastName IS NULL) OR
                      (LastName = '') OR
                      (isnumeric(id) = 0) OR
                      (id <= 0)
UNION ALL
SELECT     COUNT(id) AS Expr1
FROM         (SELECT DISTINCT id
                       FROM          dbo.PatientId_temporary AS PatientId_temporary_6) AS PatientId_temporary_4
WHERE   (isnumeric(id) = 1) AND (id IN
                          (SELECT     ID
                            FROM          dbo.Patient))
UNION ALL
SELECT DISTINCT TOP (5) id
FROM         dbo.PatientId_temporary AS PatientId_temporary_3
WHERE   (isnumeric(id) = 1) AND  (id IN
                          (SELECT     ID
                            FROM          dbo.Patient AS Patient_1))
UNION ALL
SELECT     COUNT(id) AS Expr1
FROM         (SELECT     MIN(id) AS id
                       FROM          dbo.PatientId_temporary AS PatientId_temporary_2
                       GROUP BY id
                       HAVING      (COUNT(id) > 1)) AS q
UNION ALL
SELECT     TOP (5) MIN(id) AS id
FROM         dbo.PatientId_temporary AS PatientId_temporary_1
GROUP BY id
HAVING      (COUNT(id) > 1)
