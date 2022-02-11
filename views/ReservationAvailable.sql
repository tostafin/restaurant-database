-- Show all the clients who can make a reservation
create view ReservationAvailible as
select C.CustomerID
from Customers C
where C.CustomerID in EnoughOrdersAmountForReservation and C.CustomerID in (select CustomerID from EnoughOrdersForReservation)
