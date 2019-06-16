CREATE FUNCTION fnServiceSubCost(@AppServiceID INTEGER)
RETURNS float
BEGIN
	return isnull((select sum(isnull(cost,0)) from appointmentservice where parentid=@AppServiceID),0)
END

