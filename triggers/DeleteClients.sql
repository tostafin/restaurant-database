create trigger DeleteClients
	on Clients
	for delete
	as
begin
	set nocount on
	declare @CustomerID int = (select CustomerID from deleted)
	delete
	from Companies
	where CompanyID = @CustomerID
	delete
	from PrivateClients
	where PrivateID = @CustomerID
	delete
	from Orders
	where CustomerID = @CustomerID
end