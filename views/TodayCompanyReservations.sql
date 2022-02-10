create view TodayCompanyReservations as
select C.CompanyName as data from Companies C
join CompanyReservations CR on CR.CompanyID = C.CompanyID
join Reservations R on CR.ReservationID = R.ReservationID
where convert(date, R.ReservationDate) = convert(date, getdate())
