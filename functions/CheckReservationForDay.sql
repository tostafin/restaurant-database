CREATE FUNCTION CheckReservationForDay(@ReservationDate DATE)
RETURNS TABLE
AS
RETURN
    SELECT ReservationID
    FROM Reservations
    WHERE CONVERT(DATE, ReservationDate) = @ReservationDate AND Confirmed = 1
