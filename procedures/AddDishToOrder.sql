CREATE PROCEDURE AddDishToOrder     (@ID  INTEGER,@Menu  INTEGER,
                                    @Quantity INTEGER,@Price INTEGER,
                                    @Product   INTEGER)
AS
    BEGIN
        BEGIN TRY
			declare @discount float;
			if exists (select DiscountID from DiscountHistory DH
			inner join Orders O on DH.PrivateID = O.CustomerID
			where O.OrderID = @ID)
			begin
				select @discount = Rate from Discounts D
				inner join DiscountHistory DH on D.DiscountID = DH.DiscountID
				inner join Orders O on DH.PrivateID = O.CustomerID
				where O.OrderID = @ID
			end
			else
			begin
				set @discount = 0
			end
            INSERT INTO OrderDetails (
                OrderID,
                MenuID,
                Quantity,
                UnitPrice,
                ProductID,
				Discount
            )
            VALUES (
                @ID,
                @Menu,
                @Quantity,
                @Price,
                @Product,
				@discount
            )
			update MenuPositions 
			set UnitsInStock = UnitsInStock - 1, UnitsOrdered = UnitsOrdered + 1
			where MenuID = @Menu and ProductID = @Product
        END TRY
        BEGIN CATCH
            DECLARE @msg NVARCHAR(2048) = 'Blad przy dodawaniu produktow do zamowienia!   '  + ERROR_MESSAGE();
            THROW 52000, @msg, 1;
        END CATCH
    END