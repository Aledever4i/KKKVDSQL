
CREATE VIEW V_BHMK_Services_SpecimenTypes
AS
SELECT [Code] [SpecimenTypeID], [Title] [SpecimenTypeTitle]
FROM [BHMK_Dicts]
WHERE domain='T_Sample'
