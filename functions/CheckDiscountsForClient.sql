CREATE FUNCTION CheckDiscountsForClient(@PrivateID INT)
RETURNS TABLE
AS
RETURN
    SELECT Rate
    FROM CustomersDiscounts
    WHERE PrivateID = @PrivateID
