
create procedure Add2GoodsMoveFromInventDocSpecification
 @iId int
as
 begin
  
declare
 @m int,
 @d datetime,
 @a int,
 @g varchar(150),
 @q int

  SET NOCOUNT ON

if (exists (select 1 from InventDocSpecification s, InventDoc i where s.MasterId=i.id and s.id=@iId and i.Active=1))
begin
 set @m = (select max(id)+1 from goodsmove)
 if (@m is null) set @m=0

 set @d= (select i.DocDate from InventDocSpecification s, InventDoc i where s.MasterId=i.id and s.id=@iId)
 set @g= (select s.ServiceCode from InventDocSpecification s where s.id=@iId)
 set @a= (select isnull(sum (Debet),0) from GoodsMove where GoodsCode=@g and DocDate<@d )
 set @a= @a-(select isnull(sum(Credit),0) from GoodsMove where GoodsCode=@g and DocDate<@d )
 set @q = (select s.Quant from InventDocSpecification s where s.id=@iId)-@a

 insert into GoodsMove
 select 
  @m, 
  pd.DeptId, 
  i.id, 
  6,
  i.servicecode, 
  @q, 
  0, 
  pd.docdate
 from 
  InventDocSpecification i,
  InventDoc pd
 where 
  i.MasterId=pd.id and
  i.id=@iId
end
end

