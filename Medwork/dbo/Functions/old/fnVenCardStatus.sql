
CREATE function [dbo].[fnVenCardStatus](@PatId int)
returns nvarchar(100)
as 
begin
	return (select Top 1
		bks.BriefName+case when (p.ven_karta_state=4) and (IsNull(rv.Name,'')<>'') then ' - '+rv.Name else '' end
	+case when IsNull(ven_karta_ArPlace,'')<>'' then ' ('+ven_karta_ArPlace+')' else '' end
	b_karta
	from patient p left join ResourcesView rv on rv.id=p.ven_karta_Resource
		left join b_karta_states bks on bks.id=IsNull(p.ven_karta_state,0) where p.id=@PatId)
end

