-- Add new permament discount to PermDiscounts table.
-- Executes AddDiscount with given parameters before inserting new record to PermDiscounts.
CREATE PROCEDURE AddPermDiscount    (@ID        INTEGER,
                                    @Rate       INTEGER,
                                    @addDate    DATETIME,
                                    @MinAmount  INTEGER,
                                    @MinOrdVal  INTEGER)
AS
    BEGIN
        BEGIN TRY
            EXEC AddDiscount @ID, @Rate, @addDate
            INSERT INTO PermDiscount(DiscountID,MinimalOrdersAmount,
                MinimalOrdersValue)
            VALUES( @ID, @MinAmount, @MinOrdVal)
        END TRY
        BEGIN CATCH
            DECLARE @msg NVARCHAR(2048) = 'Blad przy dodawaniu znizki permamentnej!   '  + ERROR_MESSAGE();
            THROW 52000, @msg, 1;
        END CATCH
    END