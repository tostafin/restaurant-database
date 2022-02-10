CREATE PROCEDURE ChangeOrderConditions(
    @ConditionID INT,
    @MinimalOrderAmount INT,
    @MinimalOrderCost INT
    )
AS
BEGIN
    UPDATE ReservationConditions
    SET MinimalOrderAmount = @MinimalOrderAmount, MinimalOrderCost = @MinimalOrderCost
    WHERE ConditionID = @ConditionID
END
