
CREATE FUNCTION fnServiceRootFolder(@UserGroupID INTEGER)
RETURNS INTEGER
BEGIN
  DECLARE @Folder_PriceList INTEGER
  DECLARE @Folder_Reception INTEGER
  DECLARE @Folder_Drugs INTEGER
  DECLARE @Folder_Materials INTEGER

--  ugReception = 2
--  ugDoctor = 3
--  ugEmbriologist = 4
--  ugDirector = 5
--  ugAccounter = 6
--  ugNurse = 7

  SELECT 
    @Folder_PriceList=316, 
    @Folder_Reception=302, 
    @Folder_Drugs=317, 
    @Folder_Materials=318 

  RETURN (
    SELECT  
      CASE 
        WHEN @UserGroupID=1 THEN NULL               -- Admin
        WHEN @UserGroupID=2 THEN @Folder_Reception  -- Регистратура
        WHEN @UserGroupID=6 THEN @Folder_PriceList  -- Бухгалтер
      END
  )
END
