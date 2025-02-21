CREATE TRIGGER LogBorrow
ON Borrow
AFTER INSERT
AS
BEGIN
    INSERT INTO BorrowLog (BorrowID, Action, ActionDate)
    SELECT BorrowID, 'BORROWED', GETDATE()
    FROM inserted;
END;
GO
