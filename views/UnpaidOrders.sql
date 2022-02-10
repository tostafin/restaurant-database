create view UnpaidOrders as
select OrderID from Orders
where Payment is null
