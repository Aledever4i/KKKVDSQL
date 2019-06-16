CREATE FUNCTION dbo.fnKosmCardStatus
(
	@PatId int
)
RETURNS nvarchar(100)
AS 
BEGIN
	DECLARE @CardNum nvarchar(100)
		
	SELECT
		@CardNum =
		bks.BriefName +
		CASE 
			WHEN p.kosm_karta_num IS NOT NULL
				THEN ' карта №' + CAST(p.kosm_karta_num AS nvarchar(10))
			ELSE ''
		END +
		CASE 
			WHEN p.kosm_karta_state = 4 AND rv.Name IS NOT NULL -- 4 - Бумажная карта у врача
				THEN ' - '+ rv.Name 
			ELSE '' 
		END +
	CASE 
		WHEN p.kosm_karta_ArPlace IS NOT NULL AND p.kosm_karta_ArPlace != ''
			THEN ' (' + kosm_karta_ArPlace + ')' 
		ELSE '' 
	END
	FROM dbo.patient AS p 
	LEFT JOIN dbo.ResourcesView AS rv on rv.id = p.kosm_karta_Resource
	LEFT JOIN dbo.b_karta_states AS bks on bks.id = ISNULL(p.kosm_karta_state, 0)
	WHERE p.id = @PatId
	
	RETURN @CardNum
END

