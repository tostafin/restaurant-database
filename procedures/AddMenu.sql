-- Add new menu to Menu table.
CREATE PROCEDURE AddMenu (@ID   INTEGER,
                        @From   DATE,
                        @To  DATE)
AS
    BEGIN
        BEGIN TRY
            INSERT INTO Menu (MenuID,FromDate,ToDate)
            VALUES (@ID,@From,@To)
        END TRY
        BEGIN CATCH
            DECLARE @msg NVARCHAR(2048) = 'Blad przy dodawaniu menu!   '  + ERROR_MESSAGE();
            THROW 52000, @msg, 1;
        END CATCH
    END