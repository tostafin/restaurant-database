CREATE FUNCTION ShowEmployeesOrdersSum(@OrderDate DATE)
RETURNS TABLE
AS
RETURN
    SELECT O.RestaurantEmployeeID, sum(OD.Quantity * OD.UnitPrice) as suma
    FROM Orders O
    JOIN OrderDetails OD on O.OrderID = OD.OrderID
    where DATEPART(month, @OrderDate) = DATEPART(month, OrderDate)
    GROUP BY O.RestaurantEmployeeID
