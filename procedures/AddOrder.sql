-- Add new order to Orders table.
CREATE PROCEDURE AddOrder   (@ID            INTEGER,
                            @CustomerID     INTEGER,
                            @Employee       INTEGER,
                            @Date           DATETIME,
                            @ServedDate     DATETIME,
                            @Table          INTEGER,
                            @Takeaway       BIT,
                            @ReservationID  INTEGER,
                            @Payment        VARCHAR(50),
                            @PreferredDate  DATETIME)
AS
    BEGIN
        BEGIN TRY
            INSERT INTO Orders (OrderID,CustomerID,RestaurantEmployeeID, OrderDate,ServedDate,TableID,Takeaway, ReservationID,Payment,PreferredDate)
            VALUES (@ID,@CustomerID,@Employee,@Date,@ServedDate,@Table,
                  @Takeaway, @ReservationID,@Payment,@PreferredDate)
        END TRY
        BEGIN CATCH
            DECLARE @msg NVARCHAR(2048) = 'Blad przy dodawaniu zamowienia!   '  + ERROR_MESSAGE();
            THROW 52000, @msg, 1;
        END CATCH
    END