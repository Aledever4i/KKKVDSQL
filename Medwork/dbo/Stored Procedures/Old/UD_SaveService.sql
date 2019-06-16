
Create  PROCEDURE UD_SaveService
	@oldid int,
	@pid int,
	@code Varchar(50),
	@Count int = 1,
	@name Varchar(250),
	@price float,
	@isOMS int,
	@uet float,
	@userID int,
	@PaymentType int,
	@PaymentCode int,
	@mwGUID varchar(32) = '',
	@Complex int
As begin
	if RTrim(@mwGUID) = '' Set @mwGUID = Replace(NewID(),'-','')
	if IsNull(@oldid,-1)<0
	begin
		declare @id int
		set @id=(select isnull((select max(id)+1 from UI_Service),1))
		insert into UI_Service (id, pid, code, [Count], name, price, isOMS, uet, creator, createdate, PaymentType, PaymentCode, GUID, Complex) 
		values(	@id, @pid, @code, @Count, @name, @price, @isOMS, @uet, @userID, getdate(), @PaymentType, @PaymentCode, @mwGUID, @Complex)
	end
	else
	begin
		update UI_Service
		set pid=@pid, code=@code, [Count]=@Count, name=@name, price=@price, isOMS=@isOMS, uet=@uet, creator=@userID,
							createdate=getdate(), PaymentType=@PaymentType, PaymentCode=@PaymentCode, GUID=@mwGUID, Complex=@Complex
		where id=@oldid
	end
end
