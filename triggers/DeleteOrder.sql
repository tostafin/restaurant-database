create trigger DeleteOrder
	on Orders
	for delete
	as
begin
	set nocount on
	declare @OrderID int = (select OrderID from deleted)
	delete
	from OrderDetails
	where OrderID = @OrderID
end