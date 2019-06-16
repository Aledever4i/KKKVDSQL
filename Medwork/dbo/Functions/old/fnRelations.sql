
CREATE FUNCTION dbo.fnRelations (@PatID int)
RETURNS @t TABLE (
		[ID] [int],
		[Name] nvarchar(50),
		[RelPatID] [int],
		[AttachmentID] [int]
		)
AS
BEGIN
	insert into @t ([ID],[Name],[RelPatID],[AttachmentID]) 
	(select pr.ID
		,(case when pr.Pat1ID=@PatID then rd.RelationName else rd.AntiRelationName end) Name
		,(case when pr.Pat1ID=@PatID then pr.Pat2ID else pr.Pat1ID end) RelPatID
		,cast(null as int) AttID
	from PatRelations pr
	left join PatRelationsDict rd on rd.ID=pr.RelationID
	where pr.Pat1ID=@PatID or pr.Pat2ID=@PatID
	union all
	select null
		,(case when a.MasterID=@PatID then 'основной член семьи' else 'член семьи' end) Name
		,(case when a.MasterID=@PatID then a.SelectedPat else a.MasterID end) RelPatID
		,a.ID
	from attachment a
	where (a.MasterID=@PatID and isNull(a.SelectedPat,0)>0) or a.SelectedPat=@PatID)
	return
END
