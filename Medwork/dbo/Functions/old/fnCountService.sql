
Create Function fnCountService(@sDate as DateTime,@poDate as DateTime,@ServiceType int)
Returns @Result Table([Count] int,[Sum] int)
As begin
	if @ServiceType<>0 begin
		Insert @Result
  	Select 
			case 
				when Sum(S.[Count]) is Null then 0
				else Sum(S.[Count])
			end,
			case
				when Sum([Price]*S.[Count])is Null then 0
				else Sum([Price]*S.[Count])
			end
		From 
			UD_Patient [P], UI_Diag [D], UI_Service [S]
		Where 
			(S.pid=D.id and D.pid=P.id)
			and
			(Date>=@sDate and Date<=@poDate)
			and 
			PaymentType=@ServiceType
	end else begin
		Insert @Result
  	Select 
			case 
				when Sum(S.[Count]) is Null then 0
				else Sum(S.[Count])
			end,
			case
				when Sum([Price]*S.[Count])is Null then 0
				else Sum([Price]*S.[Count])
			end
		From 
			UD_Patient [P], UI_Diag [D], UI_Service [S]
		Where 
			(S.pid=D.id and D.pid=P.id)
			and
			(Date>=@sDate and Date<=@poDate)
	end
	Return
end
