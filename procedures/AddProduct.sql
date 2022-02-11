-- Add new product to Products table.
CREATE PROCEDURE AddProduct (@ID        INTEGER,
                            @Name,      NVARCHAR(50),
                            @CatID      INTEGER)
AS
    BEGIN
        BEGIN TRY
            INSERT INTO Products(ProductID, ProductName, CategoryID)
            VALUES (@ID, @Name, @CatID);
        END TRY
        BEGIN CATCH
            DECLARE @msg NVARCHAR(2048) = 'Blad przy dodawaniu produktu!   '  + ERROR_MESSAGE();
            THROW 52000, @msg, 1;
        END CATCH
    END