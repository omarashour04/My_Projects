CREATE VIEW OverdueBooks AS
SELECT Book.Title, Borrow.BorrowDate, Borrow.DueDate, 
       DATEDIFF(DAY, Borrow.DueDate, GETDATE()) AS OverdueDays
FROM Book
JOIN Borrow ON Book.BookID = Borrow.BookID
WHERE Borrow.DueDate < GETDATE() AND Borrow.ReturnDate IS NULL;