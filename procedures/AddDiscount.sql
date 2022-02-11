-- Add new discount to Discount table.
-- Procedure is mainly used within AddPermDiscount and AddTempDiscount to ensure 
CREATE PROCEDURE AddDiscount    (@ID        INTEGER,
                                @Rate       INTEGER,
                                @addDate    DATETIME)
AS
    BEGIN
        BEGIN TRY
            INSERT INTO Discounts (DiscountID,Rate,addDate)
            VALUES (@ID, @Rate, @addDate)
        END TRY
        BEGIN CATCH
            DECLARE @msg NVARCHAR(2048) = 'Blad przy dodawaniu znizki!   '  + ERROR_MESSAGE();
            THROW 52000, @msg, 1;
        END CATCH
    END