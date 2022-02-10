create view TodayPrivateReservations as
select PC.Firstname+' '+PC.Lastname as data from PrivateClients PC
join PrivateReservations P on P.PrivateID = PC.PrivateID
join Reservations R on P.ReservationID = R.ReservationID
where convert(date, R.ReservationDate) = convert(date, getdate())
