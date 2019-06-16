
CREATE VIEW v_GrafikGospitalizatsii
AS
SELECT * FROM [GrafikGospitalizatsii] 
WHERE ISNULL(CLOSED,0) = 0
