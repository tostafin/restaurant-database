create trigger DeleteProduct
	on Products
	for delete
	as
begin
	set nocount on
	declare @ProductID int = (select ProductID from deleted)
	delete
	from MenuPositions
	where ProductID = @ProductID
end