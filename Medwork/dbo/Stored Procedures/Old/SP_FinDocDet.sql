

CREATE PROCEDURE dbo.SP_FinDocDet  @OperationType int, @DocID int
AS
declare @AccountID int

	if (@OperationType = 0) or (@OperationType = 2)
	begin
		select 
			P.DataOplati [Дата],
			case	when P.Summa > 0 then 'Оплата по счету' 
				when P.Summa < 0 then 'Возврат денег из кассы' 
			end [Документ],
			case 	when @OperationType = 0 then P.ID
				when @OperationType = 2 then B.NomerScheta
			end [№ документа],
			P.Summa [Сумма операции],
			U.Name [Оператор]
		from Payment P (nolock)
			left join Bill B (nolock) on (P.NomerScheta = B.ID)
			left join Usr U (nolock) on (P.Prinyal = U.ID)
		where B.NomerScheta = @DocID
	return
	end

