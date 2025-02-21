CREATE TRIGGER LogReturn
ON Borrow
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE ReturnDate IS NOT NULL)
    BEGIN
        INSERT INTO BorrowLog (BorrowID, Action, ActionDate)
        SELECT BorrowID, 'RETURNED', GETDATE()
        FROM inserted;
    END;
END;
GO
