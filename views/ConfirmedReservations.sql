create view ConfirmedReservations as
select ReservationID, ReservationDate
from Reservations
where Confirmed = 1
