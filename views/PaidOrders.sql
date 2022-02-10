create view PaidOrders as
select OrderID from Orders
where Payment is not null
