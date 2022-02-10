create view MostValuablePrivateCustomers as
select top 10 PC.CustomerID, sum(OD.Quantity * OD.UnitPrice) as amount
from PrivateClients PC
join Clients C2 on PC.PrivateID = C2.CustomerID
join Orders O on C2.CustomerID = O.CustomerID
join OrderDetails OD on O.OrderID = OD.OrderID
group by PC.PrivateID
order by sum(OD.Quantity * OD.UnitPrice) desc
