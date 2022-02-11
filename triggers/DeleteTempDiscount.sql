create trigger DeleteTempDiscount
	on TempDiscounts
	for delete
	as
begin
	set nocount on
	declare @DiscountID int = (select DiscountID from deleted)
	delete
	from Discounts
	where DiscountID = @DiscountID
end