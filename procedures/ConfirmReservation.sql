CREATE PROCEDURE ConfirmReservation(@ReservationID INT) AS
if not exists (select * from Reservations where ReservationID = @RID)
    begin
        throw 52000, 'Nie znaleziono rezerwacji o takim numerze ID.',1;
    end
    declare @conf int
    select @conf = Confirmed from Reservations where ReservationID = @RID
    if @conf = 1
    begin
        throw 52000, 'Rezerwacja jest już potwierdzona.', 1;
    end

    if exists (select PrivateID from PrivateReservations
                where ReservationID = @RID)
    begin
        declare @amount int, @sum int,@client int, @order int
        select @order = OrderID, @client = CustomerID from Orders where ReservationID = @RID
        select @amount = count(OrderID) from Orders where CustomerID = @client
        select @sum = sum(OD.UnitPrice * OD.Quantity * OD.Discount) from OrderDetails OD
        inner join Orders O on OD.OrderID = O.OrderID where O.CustomerID = @client
        if @amount < (select [Minimalna Ilość] from OnlineOrderConditions) and @sum < (select [Minimalna wartość] from OnlineOrderConditions)
        begin
            delete from OrderDetails where OrderID = @order
            delete from Orders where OrderID = @order
            delete from PrivateReservations where ReservationID = @RID
            delete from Reservations where ReservationID = @RID
            print 'Klient indywidualny nie spełnia wymagań rezerwacji'
        end
        else
        begin
            UPDATE Reservations
            SET Confirmed = 1
            WHERE ReservationID = @RID
        end
    end
    else
    BEGIN
        UPDATE Reservations
        SET Confirmed = 1
        WHERE ReservationID = @RID
    END
