-- Add new temporary discount to TempDiscounts table.
-- Executes AddDiscount with given parameters before inserting new record to TempDiscount.
CREATE PROCEDURE AddTempDiscount    (@ID                INTEGER,
                                    @Rate               INTEGER,
                                    @addDate            INTEGER,
                                    @MinSumOrderValue   INTEGER,
                                    @Duration           INTEGER)
AS
    BEGIN
        BEGIN TRY
            EXEC AddDiscount @ID,@Rate, @addDate
            INSERT INTO TempDiscount(DiscountID,MinimalOrdersAmount,Duration)
            VALUES(@ID,@MinSumOrderValu,@Duration)
        END TRY
        BEGIN CATCH
            DECLARE @msg NVARCHAR(2048) = 'Blad przy dodawaniu znizki tymczasowej!   '  + ERROR_MESSAGE();
            THROW 52000, @msg, 1;
        END CATCH
    END