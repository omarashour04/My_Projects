CREATE TRIGGER PreventNegativeStock
ON Book
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Stock < 0)
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'Stock cannot be negative.';
    END;
END;
GO
