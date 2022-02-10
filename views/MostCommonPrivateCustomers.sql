create view MostCommonPrivateCustomers as
select top 10 PC.CustomerID, sum(OD.Quantity) as quantity
from PrivateClients PC
join Clients C2 on PC.CustomerID = C2.CustomerID
join Orders O on C2.CustomerID = O.CustomerID
join OrderDetails OD on O.OrderID = OD.OrderID
group by PC.CustomerID
order by sum(OD.Quantity) desc
