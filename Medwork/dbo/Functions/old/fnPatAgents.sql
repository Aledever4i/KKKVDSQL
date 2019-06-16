CREATE FUNCTION [dbo].[fnPatAgents] (@PATID INT)
RETURNS NVARCHAR(4000)
BEGIN
  declare @s nvarchar(4000)
  set @s = (select usr.Name + ', ' from PatAgents
            left join usr on PatAgents.AgentUserID = usr.ID
            where PatAgents.PatID = @PATID and isnull(annulirovan,'-')<>'+'
            order by (agentdef) desc, usr.Name
            for xml path (''))
	IF LEN(@s) > 0
	  SET @S = LEFT(@s, LEN(@s)-1)
RETURN @S
END 
