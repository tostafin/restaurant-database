create trigger DeleteEmployee
	on RestaurantEmployees
	for delete
	as
begin
	set nocount on
	declare @EmployeeID int = (select RestaurantEmployeeID from deleted)
	delete
	from Orders
	where RestaurantEmployeeID = @EmployeeID
end