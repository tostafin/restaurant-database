-- Add new employee to RestaurantEmployees table.
CREATE PROCEDURE AddEmployee (@ID       INTEGER,
                              @FName     NVARCHAR(50),
                              @LName     NVARCHAR(50),
                              @BirthD    DATE,
                              @Address   NVARCHAR(MAX))
AS
    BEGIN
        BEGIN TRY
            INSERT INTO RestaurantEmployees (RestaurantEmployeeID,
                Firstname,Lastname,BirthDate,Address)
            VALUES(@ID,@FName,@LName,@BirthD,@Address)
        END TRY
        BEGIN CATCH
            DECLARE @msg NVARCHAR(2048) = 'Blad przy dodawaniu firmy!   '  + ERROR_MESSAGE();
            THROW 52000, @msg, 1;
        END CATCH
    END