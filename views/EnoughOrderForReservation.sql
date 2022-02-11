-- Show all clients who meet the amount of orders condition of making a reservation
create view EnoughOrdersForReservation as
select O.CustomerID, count(O.OrderID)
from Orders O
join CollectedOrders CO on CO.OrderID = O.OrderID
group by O.CustomerID
having count(OrderID) > (select MinimalOrderCount from ReservationConditions)