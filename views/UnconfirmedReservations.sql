create view UnconfirmedReservations as
select ReservationID, ReservationDate
from Reservations
where Confirmed = 0 or Confirmed is NULL
