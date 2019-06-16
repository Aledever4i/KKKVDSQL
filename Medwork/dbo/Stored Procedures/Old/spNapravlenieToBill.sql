
CREATE PROCEDURE spNapravlenieToBill(@PatID integer, @MasterID integer)
AS

declare @maxid integer 
declare @minid integer

IF (@masterid IS NULL) or (@masterID=0) 
begin
  select @masterid = MAX(ID) from bill where patid=@patid
end

select @maxid=ISNULL(MAX(ID),0)+1 from BillService
select @minid=MIN(ID) from Napravlenie where PatID=@PatID

insert billservice (ID, PatID, MasterID, Usluga, TsenaUslugi, KodUslugi, Summa, Kolvo, NapID)
select
  n.ID-@minID+@maxID as ID, 
  n.PatID, 
  @masterid as MasterID, 
  n.Usluga, 
  n.TsenaUslugi,  
  s.Code as KodUslugi, 
  n.TsenaUslugi as Summa, 
  1 as Kolvo, 
  n.ID as NapID  
from 
  napravlenie n with (nolock), service s with (nolock)
where 
  n.usluga=s.id 
  and n.PatID=@PatID 
  and not exists (select * from billservice where napid=n.ID)
  and ISNull(n.TsenaUslugi,0)>0
