CREATE FUNCTION CheckEmployeeForOrder(@OrderID INT)
RETURNS INT
AS
BEGIN
    DECLARE @EmployeeID INT
    SELECT @EmployeeID = RestaurantEmployeeID
    FROM Orders
    WHERE OrderID = @OrderID
    RETURN @EmployeeID
END
